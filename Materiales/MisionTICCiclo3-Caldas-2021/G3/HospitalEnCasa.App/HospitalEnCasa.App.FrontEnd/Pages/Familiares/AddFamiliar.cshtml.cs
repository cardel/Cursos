using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    [AllowAnonymous]
    public class AddFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliarDesignado repositorioFamiliarDesignado;
        public Familiar_Designado familiar { get; set; }
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<AddFamiliarModel> _logger;
        private readonly IEmailSender _emailSender;

        private readonly RoleManager<IdentityRole> roleManager;
        public AddFamiliarModel(IRepositorioFamiliarDesignado repositorioFamiliarDesignado,
        UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            ILogger<AddFamiliarModel> logger,
            IEmailSender emailSender,
            RoleManager<IdentityRole> roleManager)
        {
            this.repositorioFamiliarDesignado = repositorioFamiliarDesignado;
            familiar = new Familiar_Designado();
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            this.roleManager = roleManager;
        }

        public void OnGet()
        {
           
        }
        public async Task<IActionResult> OnPostAsync(Familiar_Designado familiar)
        {
            const string returnUrl = "Familiares/ListFamiliar";
            if (ModelState.IsValid)
            {
                var user = new IdentityUser { UserName = familiar.username, Email = familiar.email, EmailConfirmed = true };
                var result = await _userManager.CreateAsync(user, familiar.password).ConfigureAwait(false);
                var existeRol = await roleManager.RoleExistsAsync("Familiar").ConfigureAwait(false);

                if(!existeRol){
                    var role = new IdentityRole {
                        Name = "Familiar"
                    };
                    await roleManager.CreateAsync(role).ConfigureAwait(false);
                }

                if (result.Succeeded)
                {
                    repositorioFamiliarDesignado.addFamiliarDesignado(familiar);

                    _logger.LogInformation("Usuario creado con contraseña");

                    var code = await _userManager.GenerateEmailConfirmationTokenAsync(user).ConfigureAwait(false);
                    code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                    var callbackUrl = Url.Page(
                        "/Account/ConfirmEmail",
                        pageHandler: null,
                        values: new { area = "Identity", userId = user.Id, code, returnUrl },
                        protocol: Request.Scheme);

                    await _emailSender.SendEmailAsync(familiar.email, "Confirm your email",
                        $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.").ConfigureAwait(false);

                    _ = await _userManager.AddToRoleAsync(user, "Enfermera").ConfigureAwait(false);

                    if (_userManager.Options.SignIn.RequireConfirmedAccount)
                    {
                        return RedirectToPage("RegisterConfirmation", new { familiar.email, returnUrl });
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
            return Page();
        }
    }
}
