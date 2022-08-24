using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class EditPacienteModel : PageModel
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

        private Medico medico;
        private Enfermera enfermera;
        private Familiar_Designado familiar;

        public EditPacienteModel(IRepositorioPaciente repositorioPaciente, IRepositorioMedico repositorioMedico, IRepositorioEnfermera repositorioEnfermera, IRepositorioFamiliarDesignado repositorioFamiliar)
        {
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioMedico = repositorioMedico;
            this.repositorioEnfermera = repositorioEnfermera;
            this.repositorioFamiliarDesignado = repositorioFamiliar;
        }
        public void OnGet(int cedula)
        {
            paciente = repositorioPaciente.getPaciente(cedula);
            medicos = repositorioMedico.getAllMedicos().Select(
                 a => new SelectListItem
                 {
                     Value = Convert.ToString(a.cedula),
                     Text = a.nombre,
                     Selected = a.Id == paciente.medico.Id
                 }
             ).ToList();
            medicos = medicos.OrderBy(f => f.Selected).Reverse();
            enfermeras = repositorioEnfermera.getAllEnfermeras().Select(
                a => new SelectListItem
                {
                    Value = Convert.ToString(a.cedula),
                    Text = a.nombre,
                    Selected = a.Id == paciente.enfermera.Id
                }
            ).ToList();
            enfermeras = enfermeras.OrderBy(f => f.Selected).Reverse();
            familiares = repositorioFamiliarDesignado.getAllFamiliarDesignados().Select(
                a => new SelectListItem
                {
                    Value = Convert.ToString(a.cedula),
                    Text = a.nombre,
                    Selected = a.Id == paciente.familiar.Id
                }
            ).ToList();
            familiares = familiares.OrderBy(f => f.Selected).Reverse();

        }

        public IActionResult OnPost(Paciente paciente, int cedulaMedico, int cedulaEnfermera, int cedulaFamiliar)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    medico = repositorioMedico.getMedico(cedulaMedico);
                    enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);
                    familiar = repositorioFamiliarDesignado.getFamiliarDesignado(cedulaFamiliar);
                    paciente.medico = medico;
                    paciente.familiar = familiar;
                    paciente.enfermera = enfermera;

                    repositorioPaciente.editPaciente(paciente);
                    return RedirectToPage("./ListPaciente");
                }
                catch(Exception e)
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
