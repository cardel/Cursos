using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd
{
    public class DetailFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliar repositorioFamiliar;
        public Familiar familiar {get; set; }

        public DetailFamiliarModel(IRepositorioFamiliar repositorioFamiliar){
            this.repositorioFamiliar = repositorioFamiliar;
        }
        public void OnGet(int cedula)
        {
            familiar = repositorioFamiliar.getFamiliar(cedula);
        }
    }
}
