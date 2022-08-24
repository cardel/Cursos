using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class RangeCitasModel : PageModel
    {
        private readonly IRepositorioCita repositorioCita;
        public List<DateTime> Dias {get; set;}
        public List<int> NumCitas {get; set;}
        public RangeCitasModel(IRepositorioCita repositorioCita){
            this.repositorioCita = repositorioCita;
            Dias = new List<DateTime>();
            NumCitas = new List<int>();
        }
        public void OnGet(DateTime DiaInicial, DateTime DiaFinal)
        {
            DateTime diaI = DiaInicial;
            DateTime diaF = DiaFinal;

            while(diaI <= diaF){
                Dias.Add(diaI);
                NumCitas.Add(repositorioCita.ReportCitas(diaI));
                diaI = diaI.AddDays(1);
            }
        }
    }
}
