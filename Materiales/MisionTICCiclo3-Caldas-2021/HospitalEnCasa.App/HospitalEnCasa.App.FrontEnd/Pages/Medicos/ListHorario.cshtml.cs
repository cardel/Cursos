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
    public class ListHorarioModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        public IEnumerable<Medico> Medicos{ get; set;}

        public ListHorarioModel(IRepositorioMedico repositorioMedico){
            this.repositorioMedico = repositorioMedico;
            Medicos = repositorioMedico.getMedicos();
        }
        public void OnGet()
        {
        }
    }
}
