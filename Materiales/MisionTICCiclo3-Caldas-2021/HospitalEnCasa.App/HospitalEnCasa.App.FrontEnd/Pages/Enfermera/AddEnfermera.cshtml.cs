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
    public class AddEnfermeraModel : PageModel
    {
        
        private readonly IRepositorioEnfermera repositorioEnfermera;
        public Enfermera enfermera {get; set;}
        public AddEnfermeraModel(IRepositorioEnfermera repositorioEnfermera){
            this.repositorioEnfermera = repositorioEnfermera;
        }
        public void OnGet()
        {
            enfermera = new Enfermera();
        }

        public IActionResult OnPost(Enfermera enfermera){
            try{
                repositorioEnfermera.addEnfermera(enfermera);
                return RedirectToPage("./ListEnfermera");
            }
            catch{
                return RedirectToPage("../Error");

            }
        }
    }
}
