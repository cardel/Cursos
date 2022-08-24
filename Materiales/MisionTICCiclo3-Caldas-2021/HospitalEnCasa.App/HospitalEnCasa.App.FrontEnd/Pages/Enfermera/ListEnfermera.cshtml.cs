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
    public class ListEnfermeraModel : PageModel
    {
        private readonly IRepositorioEnfermera repositorioEnfermera;
        public IEnumerable<Enfermera> enfermeras {get; set;}
        public ListEnfermeraModel(IRepositorioEnfermera repositorioEnfermera){
            this.repositorioEnfermera = repositorioEnfermera;
        }
        public void OnGet()
        {
            enfermeras = repositorioEnfermera.getAllEnfermeras();
        }
    }
}
