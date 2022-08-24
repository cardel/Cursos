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
    public class DetailHistoriaModel : PageModel
    {
        private readonly IRepositorioHistoria repositorioHistoria;
        public Historia Historia { get; set; }
        public DetailHistoriaModel(IRepositorioHistoria repositorioHistoria){
            this.repositorioHistoria = repositorioHistoria;
            
        }

        public void OnGet(int idHistoria)
        {
            Historia = repositorioHistoria.getHistoria(idHistoria);
        }
    }
}
