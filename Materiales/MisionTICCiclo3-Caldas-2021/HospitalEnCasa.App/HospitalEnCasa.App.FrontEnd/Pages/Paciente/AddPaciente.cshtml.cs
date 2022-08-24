using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class AddPacienteModel : PageModel
    {
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioFamiliar repositorioFamiliar;
        private readonly IRepositorioEnfermera repositorioEnfermera;
        public Paciente paciente { get; set; }
        public int cedulaMedico { get; set; }
        public int cedulaFamiliar { get; set; }
        public int cedulaEnfermera { get; set; }
        public IEnumerable<SelectListItem> medicos { get; set; }
        public IEnumerable<SelectListItem> enfermeras { get; set; }
        public IEnumerable<SelectListItem> familiares { get; set; }

        public Enfermera enfermera { get; set; }
        public Medico medico { get; set; }
        public Familiar familiar { get; set; }

        public AddPacienteModel(IRepositorioPaciente repositorioPaciente, IRepositorioMedico repositorioMedico, IRepositorioEnfermera repositorioEnfermera, IRepositorioFamiliar repositorioFamiliar)
        {
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioEnfermera = repositorioEnfermera;
            this.repositorioMedico = repositorioMedico;
            this.repositorioFamiliar = repositorioFamiliar;
            Inicializar();
        }
        public void OnGet()
        {

        }

        public void Inicializar()
        {
            paciente = new Paciente();
            medicos = repositorioMedico.getMedicos().Select(
            m => new SelectListItem
            {
                Text = m.nombre,
                Value = Convert.ToString(m.cedula)
            }
        );

            familiares = repositorioFamiliar.getAllFamiliares().Select(
                f => new SelectListItem
                {
                    Text = f.nombre,
                    Value = Convert.ToString(f.cedula)
                }
            );

            enfermeras = repositorioEnfermera.getAllEnfermeras().Select(
                e => new SelectListItem
                {
                    Text = e.nombre,
                    Value = Convert.ToString(e.cedula)
                }
            );
        }
        public IActionResult OnPost(Paciente paciente, int cedulaMedico, int cedulaEnfermera, int cedulaFamiliar)
        {

            if (!ModelState.IsValid)
            {
                return Page();
            }
            try
            {
                repositorioPaciente.agregarPaciente(paciente);
                medico = repositorioMedico.obtenerMedico(cedulaMedico);
                familiar = repositorioFamiliar.getFamiliar(cedulaFamiliar);
                enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);

                paciente.medico = medico;
                paciente.enfermera = enfermera;
                paciente.familiar = familiar;

                repositorioPaciente.editarPaciente(paciente);
                return RedirectToPage("./ListPaciente");
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return RedirectToPage("../Error");
            }
        }

    }
}

