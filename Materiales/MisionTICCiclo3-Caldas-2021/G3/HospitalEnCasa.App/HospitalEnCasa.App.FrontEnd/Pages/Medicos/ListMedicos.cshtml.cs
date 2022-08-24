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
    public class ListMedicosModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        public IEnumerable<Medico> medicos;
        public ListMedicosModel(IRepositorioMedico repositorioMedico){
            this.repositorioMedico = repositorioMedico;
        }
        public void OnGet()
        {
            medicos = repositorioMedico.getAllMedicos();
        }
    }
}
