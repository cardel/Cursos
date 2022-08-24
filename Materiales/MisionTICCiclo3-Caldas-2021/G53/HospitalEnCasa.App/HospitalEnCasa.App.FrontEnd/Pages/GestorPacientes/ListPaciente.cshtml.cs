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
        private readonly IRepositorioPaciente repositorioPaciente;
        public IEnumerable<Paciente> pacientes {get; set;}

        public ListPacienteModel(IRepositorioPaciente repos){
            this.repositorioPaciente = repos;
        }
        public void OnGet()
        {
            pacientes = repositorioPaciente.getAllPacientes();
        }
    }
}
