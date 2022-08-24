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
    public class DetailPacienteModel : PageModel
    {
        private readonly IRepositorioPaciente repositorioPaciente;
        public Paciente paciente {get; set; }
        
        public DetailPacienteModel(IRepositorioPaciente repositorioPaciente){
            this.repositorioPaciente = repositorioPaciente;
        }
        public void OnGet(int cedula)
        {
            paciente = repositorioPaciente.obtenerPaciente(cedula);
        }
    }
}
