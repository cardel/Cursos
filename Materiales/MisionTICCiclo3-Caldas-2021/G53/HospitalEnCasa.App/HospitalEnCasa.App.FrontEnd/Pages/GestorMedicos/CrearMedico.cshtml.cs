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
using Microsoft.VisualBasic;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class CrearMedicoModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<CrearMedicoModel> _logger;

        private readonly RoleManager<IdentityRole> roleManager;

        private readonly IEmailSender _emailSender;
        public Medico medico { get; set; }


        public CrearMedicoModel(IRepositorioMedico repositorioMedico,
        UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            ILogger<CrearMedicoModel> logger,
            IEmailSender emailSender, 
            RoleManager<IdentityRole> roleManager)
        {
            this.repositorioMedico = repositorioMedico;
            Medico medico = new Medico();
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            this.roleManager = roleManager;

        }
        public void OnGet()
        {

        }

        public async Task<IActionResult> OnPostAsync(Medico medico)
        {

            string returnUrl = "/GestorMedicos/ListMedico";
            if (ModelState.IsValid)
            {
                try
                {
                    string Password = medico.password;
                    repositorioMedico.addMedico(medico);
                    var user = new IdentityUser { UserName = medico.username, Email = medico.email, EmailConfirmed = true };
                    _logger.LogInformation(Password);
                    var result = await _userManager.CreateAsync(user, Password);


                    var rolExiste = await roleManager.RoleExistsAsync("Medico");

                    if (!rolExiste)
                    {
                        var role = new IdentityRole
                        {
                            Name = "Medico"
                        };
                        await roleManager.CreateAsync(role);
                    }


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

                        await _emailSender.SendEmailAsync(medico.email, "Confirm your email",
                            $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.");

                        var roleresult = await _userManager.AddToRoleAsync(user,"Medico").ConfigureAwait(false);
                        if (_userManager.Options.SignIn.RequireConfirmedAccount)
                        {
                            return RedirectToPage("RegisterConfirmation", new { email = medico.email, returnUrl = returnUrl });
                        }
                        else
                        {   
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
