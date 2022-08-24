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
    public class ListFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliar repositorioFamiliar;
        public IEnumerable<Familiar> familiares { get; set;}
        
        public ListFamiliarModel(IRepositorioFamiliar repositorio){
            this.repositorioFamiliar = repositorio;
        }
        public void OnGet()
        {
            familiares = repositorioFamiliar.getAllFamiliares();
        }
    }
}
