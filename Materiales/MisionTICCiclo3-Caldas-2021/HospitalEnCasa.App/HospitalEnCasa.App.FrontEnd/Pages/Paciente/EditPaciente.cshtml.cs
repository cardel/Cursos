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
        private readonly IRepositorioEnfermera repositorioEnfermera;
        private readonly IRepositorioFamiliar repositorioFamiliar;

        public Paciente paciente { get; set; }
        public int cedulaMedico { get; set; }
        public int cedulaFamiliar { get; set; }
        public int cedulaEnfermera { get; set; }

        public IEnumerable<SelectListItem> medicos { get; set; }
        public IEnumerable<SelectListItem> enfermeras { get; set; }
        public IEnumerable<SelectListItem> familiares { get; set; }

        public EditPacienteModel(IRepositorioPaciente repositorioPaciente, IRepositorioMedico repositorioMedico, IRepositorioFamiliar repositorioFamiliar, IRepositorioEnfermera repositorioEnfermera)
        {
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioMedico = repositorioMedico;
            this.repositorioFamiliar = repositorioFamiliar;
            this.repositorioEnfermera = repositorioEnfermera;
        }
        public void OnGet(int cedula)
        {
            paciente = repositorioPaciente.obtenerPaciente(cedula);
            
            if(paciente.medico == null){
                paciente.medico = new Medico(){
                    cedula = 0
                };
            }
            if(paciente.enfermera == null){
                paciente.enfermera = new Enfermera(){
                    cedula = 0
                };
            }
            if(paciente.familiar == null){
                paciente.familiar = new Familiar(){
                    cedula = 0
                };
            }
            medicos = repositorioMedico.getMedicos().Select(
                m => new SelectListItem
                {
                    Text = m.nombre,
                    Value = Convert.ToString(m.cedula),
                    Selected = m.cedula == paciente.medico.cedula
                }
                ).ToList();

            medicos = medicos.OrderBy(m => m.Selected).Reverse();

            enfermeras = repositorioEnfermera.getAllEnfermeras().Select(
                f => new SelectListItem
                {
                    Text = f.nombre,
                    Value = Convert.ToString(f.cedula),
                    Selected = f.cedula == paciente.enfermera.cedula
                }
            ).ToList();
            enfermeras = enfermeras.OrderBy(e => e.Selected).Reverse();

            familiares = repositorioFamiliar.getAllFamiliares().Select(
                f => new SelectListItem
                {
                    Text = f.nombre,
                    Value = Convert.ToString(f.cedula),
                    Selected = f.cedula == paciente.familiar.cedula
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
                    repositorioPaciente.editarPaciente(paciente);

                    Medico medico = repositorioMedico.obtenerMedico(cedulaMedico);
                    Enfermera enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);
                    Familiar familiar = repositorioFamiliar.getFamiliar(cedulaFamiliar);


                    paciente.medico = medico;
                    paciente.enfermera = enfermera;
                    paciente.familiar = familiar;

                    repositorioPaciente.editarPaciente(paciente);
                    return RedirectToPage("./ListPaciente");
                }
                catch
                {
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
