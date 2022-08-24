using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using HospitalEnCasa.app.Persistencia;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class DetalleMedicoModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        public Medico medico {get; set; }

        public DetalleMedicoModel(IRepositorioMedico repositorioMedico){
            this.repositorioMedico = repositorioMedico;
        }

        public void OnGet(int cedula)
        {
            medico = repositorioMedico.obtenerMedico(cedula);
        }
    }
}
