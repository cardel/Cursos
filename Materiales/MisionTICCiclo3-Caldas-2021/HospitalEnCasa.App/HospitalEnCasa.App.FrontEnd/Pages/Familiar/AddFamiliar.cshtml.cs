using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd
{
    public class AddFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliar repositorioFamiliar;
        public Familiar familiar { get; set; }
        public AddFamiliarModel(IRepositorioFamiliar repositorio)
        {
            this.repositorioFamiliar = repositorio;
        }
        public void OnGet()
        {
            familiar = new Familiar();
        }

        public IActionResult OnPost(Familiar familiar)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    repositorioFamiliar.addFamiliar(familiar);
                    return RedirectToPage("./ListFamiliar");
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
