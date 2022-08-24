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
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class AddPacienteModel : PageModel
    {
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioFamiliarDesignado repositorioFamiliarDesignado;

        private readonly IRepositorioEnfermera repositorioEnfermera;
        public Paciente paciente { get; set; }

        public IEnumerable<SelectListItem> medicos { get; set; }
        public IEnumerable<SelectListItem> enfermeras { get; set; }
        public IEnumerable<SelectListItem> familiares { get; set; }
        public int cedulaMedico { get; set; }
        public int cedulaEnfermera { get; set; }
        public int cedulaFamiliar { get; set; }
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<AddFamiliarModel> _logger;
        private readonly IEmailSender _emailSender;

        private readonly RoleManager<IdentityRole> roleManager;
        public AddPacienteModel(IRepositorioPaciente repositorioPaciente,
        IRepositorioMedico repositorioMedico,
        IRepositorioFamiliarDesignado repositorioFamiliarDesignado,
        IRepositorioEnfermera repositorioEnfermera,
        UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            ILogger<AddFamiliarModel> logger,
            IEmailSender emailSender,
            RoleManager<IdentityRole> roleManager
        )
        {
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioMedico = repositorioMedico;
            this.repositorioEnfermera = repositorioEnfermera;
            this.repositorioFamiliarDesignado = repositorioFamiliarDesignado;
            paciente = new Paciente();
            medicos = repositorioMedico.getAllMedicos().Select(
                a => new SelectListItem
                {
                    Value = Convert.ToString(a.cedula),
                    Text = a.nombre
                }
                ).ToList();
            enfermeras = repositorioEnfermera.getAllEnfermeras().Select(
                a => new SelectListItem
                {
                    Value = Convert.ToString(a.cedula),
                    Text = a.nombre
                }
                    ).ToList();
            familiares = repositorioFamiliarDesignado.getAllFamiliarDesignados().Select(
                a => new SelectListItem
                {
                    Value = Convert.ToString(a.cedula),
                    Text = a.nombre
                }
            ).ToList();
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            this.roleManager = roleManager;
        }
        public void OnGet()
        {

        }

        public async Task<IActionResult> OnPostAsync(Paciente paciente, int cedulaMedico, int cedulaEnfermera, int cedulaFamiliar)
        {
            const string returnUrl = "./Pacientes/ListPaciente";
            if (ModelState.IsValid)
            {
                var user = new IdentityUser { UserName = paciente.username, Email = paciente.email, EmailConfirmed = true };
                var result = await _userManager.CreateAsync(user, paciente.password).ConfigureAwait(false);
                var existeRol = await roleManager.RoleExistsAsync("Paciente").ConfigureAwait(false);

                if (!existeRol)
                {
                    var role = new IdentityRole
                    {
                        Name = "Paciente"
                    };
                    await roleManager.CreateAsync(role).ConfigureAwait(false);
                }

                if (result.Succeeded)
                {
                    Medico medico = repositorioMedico.getMedico(cedulaMedico);
                    Enfermera enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);
                    Familiar_Designado familiar = repositorioFamiliarDesignado.getFamiliarDesignado(cedulaFamiliar);

                    Paciente nuevoPaciente = new Paciente()
                    {
                        cedula = paciente.cedula,
                        nombre = paciente.nombre,
                        edad = paciente.edad,
                        genero = paciente.genero,
                        direccion = paciente.direccion,
                        latitud = paciente.latitud,
                        longitud = paciente.longitud,
                        familiar = familiar,
                        enfermera = enfermera,
                        medico = medico,
                        username = paciente.username,
                        email = paciente.email,
                        password = paciente.password

                    };
                    repositorioPaciente.addPaciente(nuevoPaciente);

                    _logger.LogInformation("Usuario creado con contraseña");

                    var code = await _userManager.GenerateEmailConfirmationTokenAsync(user).ConfigureAwait(false);
                    code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                    var callbackUrl = Url.Page(
                        "/Account/ConfirmEmail",
                        pageHandler: null,
                        values: new { area = "Identity", userId = user.Id, code, returnUrl },
                        protocol: Request.Scheme);

                    await _emailSender.SendEmailAsync(paciente.email, "Confirm your email",
                        $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.").ConfigureAwait(false);

                    _ = await _userManager.AddToRoleAsync(user, "Paciente").ConfigureAwait(false);

                    if (_userManager.Options.SignIn.RequireConfirmedAccount)
                    {
                        return RedirectToPage("RegisterConfirmation", new { paciente.email, returnUrl });
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
