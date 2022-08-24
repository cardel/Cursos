using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class ListCitaModel : PageModel
    {
        private readonly IRepositorioCita repositorioCita;

        public IEnumerable<Cita> citas;
        [DataType(DataType.Date),Range(typeof(DateTime), "1/1/2021", "31/12/2025",
        ErrorMessage = "El valor {0} debe estar {1} y {2}")]
        public DateTime Dia { get; set; }

        [DataType(DataType.Date),Range(typeof(DateTime), "1/1/2021", "31/12/2025",
        ErrorMessage = "El valor {0} debe estar {1} y {2}")]
        public DateTime DiaInicial { get; set; }
        [DataType(DataType.Date),Range(typeof(DateTime), "1/1/2021", "31/12/2025",
        ErrorMessage = "El valor {0} debe estar {1} y {2}")]
        public DateTime DiaFinal { get; set; }
        public ListCitaModel(IRepositorioCita repositorio){
            this.repositorioCita = repositorio;
            citas = repositorioCita.getAllCitas();
        }
        public void OnGet()
        {
        }
    }
}
