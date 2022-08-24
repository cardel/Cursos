using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;


namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class CrearEnfermeraModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<CrearEnfermeraModel> _logger;

        private readonly IEmailSender _emailSender;
        private IRepositorioEnfermera repositorioEnfermera;
        public Enfermera enfermera { get; set; }
        
        public CrearEnfermeraModel(IRepositorioEnfermera repositorioEnfermera,
        UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            ILogger<CrearEnfermeraModel> logger,
            IEmailSender emailSender)
        {
            this.repositorioEnfermera = repositorioEnfermera;
            Enfermera enfermera = new Enfermera();
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
        }
        public void OnGet()
        {

        }
        public async Task<IActionResult> OnPostAsync(Enfermera enfermera)
        {
            string returnUrl = "/GestorEnfermeras/ListEnfermera";
            if (ModelState.IsValid)
            {
                try
                {
                    string Password = enfermera.password;
                    repositorioEnfermera.addEnfermera(enfermera);
                    var user = new IdentityUser { UserName = enfermera.username, Email = enfermera.email, EmailConfirmed = true };
                    _logger.LogInformation(Password);
                    var result = await _userManager.CreateAsync(user, Password);
                    if (result.Succeeded)
                    {
                        _logger.LogInformation("User created a new account with password.");

                        var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                        code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                        var callbackUrl = Url.Page(
                            "/Account/ConfirmEmail",
                            pageHandler: null,
                            values: new { area = "Identity", userId = user.Id, code = code, returnUrl = returnUrl },
                            protocol: Request.Scheme);

                        await _emailSender.SendEmailAsync(enfermera.email, "Confirm your email",
                            $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.");

                        if (_userManager.Options.SignIn.RequireConfirmedAccount)
                        {
                            return RedirectToPage("RegisterConfirmation", new { email = enfermera.email, returnUrl = returnUrl });
                        }
                        else
                        {
                            await _signInManager.SignInAsync(user, isPersistent: false);
                            return LocalRedirect(returnUrl);
                        }
                    }
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                    return Page();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    return RedirectToPage("../Error");
                }
            }
            else
            {
                return Page();
            }

        }


    }
}
