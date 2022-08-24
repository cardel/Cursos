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
    public class EditarEnfermeraModel : PageModel
    {

        private IRepositorioEnfermera repositorioEnfermera;
        public Enfermera enfermera { get; set; }
        public EditarEnfermeraModel(IRepositorioEnfermera repositorioEnfermera)
        {
            this.repositorioEnfermera = repositorioEnfermera;
        }
        public void OnGet(int cedula)
        {
            enfermera = repositorioEnfermera.getEnfermera(cedula);
        }

        public IActionResult OnPost(Enfermera enfermera)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    repositorioEnfermera.editEnfermera(enfermera);
                    return RedirectToPage("./ListarEnfermeras");
                }
                catch
                {
                    return RedirectToPage("../Error");
                }
            }
            else
            {
                return Page();
            }
        }

    }
}
