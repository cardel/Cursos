using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class ListPacienteModel : PageModel
    {
        private IRepositorioPaciente repositorioPaciente;
        public IEnumerable<Paciente> pacientes { get; set;}

        public String mensaje {get; set;}

        public ListPacienteModel(IRepositorioPaciente repositorioPaciente){
            this.repositorioPaciente = repositorioPaciente;
            this.mensaje = "No asignado";
        }
        public void OnGet()
        {
            pacientes = repositorioPaciente.obtenerPacientes();
        }
    }
}
