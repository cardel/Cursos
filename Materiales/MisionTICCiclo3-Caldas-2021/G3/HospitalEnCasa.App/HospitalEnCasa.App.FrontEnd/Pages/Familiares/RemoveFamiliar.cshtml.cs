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
    public class RemoveFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliarDesignado repositorioFamiliarDesignado;
        public Familiar_Designado familiar { get; set; }

        public RemoveFamiliarModel(IRepositorioFamiliarDesignado repositorioFamiliarDesignado){
            this.repositorioFamiliarDesignado = repositorioFamiliarDesignado;
        }
        public void OnGet(int cedula)
        {
            familiar = repositorioFamiliarDesignado.getFamiliarDesignado(cedula);
        }

        public IActionResult OnPost(Familiar_Designado familiar){
            try{
                repositorioFamiliarDesignado.RemoveFamiliarDesignado(familiar.cedula);
                return RedirectToPage("./ListFamiliar");
            }
            catch(Exception e){
                Console.WriteLine(e);
                return RedirectToPage("../Error");
            }
        }
    }
}
