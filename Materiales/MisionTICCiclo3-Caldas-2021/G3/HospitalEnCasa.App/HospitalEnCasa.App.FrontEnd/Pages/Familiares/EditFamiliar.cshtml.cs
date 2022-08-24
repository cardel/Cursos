using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class EditFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliarDesignado repositorioFamiliarDesignado;
        public Familiar_Designado familiar { get; set; }

        public EditFamiliarModel(IRepositorioFamiliarDesignado repositorioFamiliar){
            this.repositorioFamiliarDesignado = repositorioFamiliar;
        }
        public void OnGet(int cedula)
        {
            familiar = repositorioFamiliarDesignado.getFamiliarDesignado(cedula);
        }

        public IActionResult OnPost(Familiar_Designado familiar){
            if(ModelState.IsValid){
                try{
                    repositorioFamiliarDesignado.editFamiliarDesignado(familiar);
                    return RedirectToPage("./ListFamiliar");
                }
                catch{
                    return RedirectToPage("../Error");
                }
            }
            else{
                return RedirectToPage("../Error");
            }
        }
    }
}
