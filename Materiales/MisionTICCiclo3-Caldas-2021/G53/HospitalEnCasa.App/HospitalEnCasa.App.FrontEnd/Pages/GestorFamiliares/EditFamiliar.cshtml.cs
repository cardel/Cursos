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
    public class EditFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliar repositorioFamiliar;
        public Familiar familiar { get; set; }
        public EditFamiliarModel(IRepositorioFamiliar repositorio)
        {
            this.repositorioFamiliar = repositorio;
        }
        public void OnGet(int cedula)
        {
            familiar = repositorioFamiliar.getFamiliar(cedula);
        }

        public IActionResult OnPost(Familiar familiar)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    repositorioFamiliar.editFamiliar(familiar);
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
