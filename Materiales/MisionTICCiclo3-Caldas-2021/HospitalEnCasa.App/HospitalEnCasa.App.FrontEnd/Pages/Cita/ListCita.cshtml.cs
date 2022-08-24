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
    public class ListCitaModel : PageModel
    {
        private readonly IRepositorioCita repositorioCita;
        public IEnumerable<Cita> Citas { get; set; }

        public ListCitaModel(IRepositorioCita repositorioCita){
            this.repositorioCita = repositorioCita;
            Citas =repositorioCita.GetAllCitas();
        }
        public void OnGet()
        {
        }
    }
}
