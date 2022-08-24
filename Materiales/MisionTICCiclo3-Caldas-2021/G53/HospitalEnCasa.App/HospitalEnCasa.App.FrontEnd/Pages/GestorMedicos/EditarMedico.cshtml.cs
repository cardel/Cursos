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
    public class EditarMedicoModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        public Medico medico { get; set; }

        public EditarMedicoModel(IRepositorioMedico repositorioMedico){
            this.repositorioMedico = repositorioMedico;
        }
        public void OnGet(int cedula)
        {
            medico = repositorioMedico.getMedico(cedula);
        }

        public IActionResult OnPost(Medico medico){
            if(ModelState.IsValid){
                repositorioMedico.editMedico(medico);
                return RedirectToPage("./ListMedico");
            }else{
                return Page();
            }

        }
    }
}
