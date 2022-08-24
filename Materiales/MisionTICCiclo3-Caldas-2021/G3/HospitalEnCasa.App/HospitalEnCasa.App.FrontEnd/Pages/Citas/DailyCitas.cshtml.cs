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
    public class DailyCitasModel : PageModel
    {
        private readonly IRepositorioCita repositorioCita;
        public IEnumerable<Cita> Citas {get; set;}

        public DailyCitasModel(IRepositorioCita repositorioCita){
            this.repositorioCita = repositorioCita;
        }
        
        public void OnGet(DateTime Dia)
        {
            Citas = repositorioCita.getCitasPerDay(Dia);
        }
    }
}
