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
    public class EditarMedicoModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        public Medico medico {get; set; }

        public EditarMedicoModel(IRepositorioMedico repositorioMedico){
            this.repositorioMedico = repositorioMedico;
        }

        public IActionResult OnGet(int cedula)
        {
            medico = repositorioMedico.obtenerMedico(cedula);
            if(medico == null){
                return RedirectToPage("./NotFound");
            }
            else{
                return Page();
            }
            
        }

        public IActionResult OnPost(Medico medico){

            if(ModelState.IsValid){
                repositorioMedico.editMedico(medico);
                return RedirectToPage("./ListaMedicos");
            }else{
                return Page();
            }
        }
    }
}
