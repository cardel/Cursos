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
    public class VerEnfermeraModel : PageModel
    {
        private IRepositorioEnfermera repositorioEnfermera;
        public Enfermera enfermera { get; set; }
        public VerEnfermeraModel(IRepositorioEnfermera repositorioEnfermera){
            this.repositorioEnfermera = repositorioEnfermera;
        }
        public void OnGet(int cedula)
        {
            enfermera = repositorioEnfermera.getEnfermera(cedula);
        }

        
    }
}
