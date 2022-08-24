using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;


namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class AddEnfermeraModel : PageModel
    {
        private readonly IRepositorioEnfermera repositorioEnfermera;
        public Enfermera enfermera { get; set; }
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<AddEnfermeraModel> _logger;
        private readonly IEmailSender _emailSender;

        private readonly RoleManager<IdentityRole> roleManager;
        public AddEnfermeraModel(IRepositorioEnfermera repositorioEnfermera,
        UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            ILogger<AddEnfermeraModel> logger,
            IEmailSender emailSender,
            RoleManager<IdentityRole> roleManager)
        {
            this.repositorioEnfermera = repositorioEnfermera;
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            this.roleManager = roleManager;
            enfermera = new Enfermera();
        }
        public void OnGet()
        {
            
        }

        public async Task<IActionResult> OnPostAsync(Enfermera enfermera)
        {
            const string returnUrl = "Enfermeras/ListEnfermera";
            if (ModelState.IsValid)
            {
                var user = new IdentityUser { UserName = enfermera.username, Email = enfermera.email, EmailConfirmed = true };
                var result = await _userManager.CreateAsync(user, enfermera.password).ConfigureAwait(false);
                var existeRol = await roleManager.RoleExistsAsync("Enfermera").ConfigureAwait(false);

                if(!existeRol){
                    var role = new IdentityRole {
                        Name = "Enfermera"
                    };
                    await roleManager.CreateAsync(role).ConfigureAwait(false);
                }

                if (result.Succeeded)
                {
                    repositorioEnfermera.addEnfermera(enfermera);

                    _logger.LogInformation("Usuario creado con contraseña");

                    var code = await _userManager.GenerateEmailConfirmationTokenAsync(user).ConfigureAwait(false);
                    code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                    var callbackUrl = Url.Page(
                        "/Account/ConfirmEmail",
                        pageHandler: null,
                        values: new { area = "Identity", userId = user.Id, code, returnUrl },
                        protocol: Request.Scheme);

                    await _emailSender.SendEmailAsync(enfermera.email, "Confirm your email",
                        $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.").ConfigureAwait(false);

                    _ = await _userManager.AddToRoleAsync(user, "Enfermera").ConfigureAwait(false);

                    if (_userManager.Options.SignIn.RequireConfirmedAccount)
                    {
                        return RedirectToPage("RegisterConfirmation", new { enfermera.email, returnUrl });
                    }
                    else
                    {
                        await _signInManager.SignInAsync(user, isPersistent: false).ConfigureAwait(false);
                        return LocalRedirect(returnUrl);
                    }
                }
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }

            // If we got this far, something failed, redisplay form
            return Page();
        }
    }
}
