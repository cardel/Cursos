using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using HospitalEnCasa.app.Dominio;


namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class ListMedicoModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        public IEnumerable<Medico> medicos;

        public ListMedicoModel(IRepositorioMedico repositorioMedico){
            this.repositorioMedico = repositorioMedico;
        }
        public void OnGet()
        {
            medicos = repositorioMedico.getAllMedicos();
        }
    }
}
