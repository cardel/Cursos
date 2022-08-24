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
    public class AddPacienteModel : PageModel
    {
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioEnfermera repositorioEnfermera;
        private readonly IRepositorioFamiliar repositorioFamiliar;
        public Paciente paciente {get; set; }
        public List<SelectListItem> medicos {get; set; }
        public List<SelectListItem> enfermeras {get; set; }
        public List<SelectListItem> familiares {get; set; }

        public int cedulaMedico { get; set; }
        public int cedulaEnfermera { get; set; }
        public int cedulaFamiliar {get; set; }

        public AddPacienteModel(IRepositorioPaciente repositorioPaciente, IRepositorioMedico repositorioMedico, IRepositorioFamiliar repositorioFamiliar, IRepositorioEnfermera repositorioEnfermera){
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioMedico = repositorioMedico;
            this.repositorioFamiliar = repositorioFamiliar;
            this.repositorioEnfermera = repositorioEnfermera;

                        paciente = new Paciente();
            medicos = repositorioMedico.getAllMedicos().Select(
                m => new SelectListItem{
                    Text = m.nombre,
                    Value = Convert.ToString(m.cedula)
                }
            ).ToList();
            enfermeras = repositorioEnfermera.getEnfermeras().Select(
                e => new SelectListItem{
                    Text = e.nombre,
                    Value = Convert.ToString(e.cedula)
                }
            ).ToList();

            familiares = repositorioFamiliar.getAllFamiliares().Select(
                f => new SelectListItem{
                    Text = f.nombre,
                    Value = Convert.ToString(f.cedula)
                }
            ).ToList();
        }
        public void OnGet()
        {

        }

        public ActionResult OnPost(Paciente paciente, int cedulaMedico, int cedulaEnfermera, int cedulaFamiliar){
            if(ModelState.IsValid){
                try{
                    Enfermera enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);
                    Medico medico = repositorioMedico.getMedico(cedulaMedico);
                    Familiar familiar = repositorioFamiliar.getFamiliar(cedulaFamiliar);

                    //Se agrega tal cual, por problema del framework al intentar editar el objeto el ID se establece
                    repositorioPaciente.addPaciente(paciente);

                    paciente.medico = medico;
                    paciente.familiar = familiar;
                    paciente.enfermera = enfermera;

                    repositorioPaciente.editPaciente(paciente);

                    return RedirectToPage("./ListPaciente");
                }
                catch(Exception e){
                    Console.WriteLine(e);
                    return RedirectToPage("../Error");
                }
            }
            else{
                return Page();
            }
        }
    }
}
