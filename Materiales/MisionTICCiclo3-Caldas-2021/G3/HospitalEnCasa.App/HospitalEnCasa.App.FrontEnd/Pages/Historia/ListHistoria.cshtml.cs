using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd
{
    [Authorize(Roles = "Medico,Enfermera,Admin")]
    public class ListHistoriaModel : PageModel
    {
        private readonly IRepositorioHistoria repositorioHistoria;
        public IEnumerable<Historia> historias;
        public Paciente paciente { get; set; }

        public ListHistoriaModel(IRepositorioHistoria repositorioHistoria){
            this.repositorioHistoria = repositorioHistoria;
            historias = repositorioHistoria.getAllHistoria();
        }
        public void OnGet()
        {
        }
    }
}
