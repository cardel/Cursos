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
    public class ListHistoriaModel : PageModel
    {
        private readonly IRepositorioHistoria repositorioHistoria;
        public IEnumerable<Historia> Historias {get; set;}

        public ListHistoriaModel(IRepositorioHistoria repositorioHistoria){
            this.repositorioHistoria = repositorioHistoria;
            Historias = repositorioHistoria.getAllHistoria();
        }
        public void OnGet()
        {
        }
    }
}
