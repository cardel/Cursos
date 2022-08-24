using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    [AllowAnonymous]
    public class ListFamiliarModel : PageModel
    {
        private readonly IRepositorioFamiliarDesignado repositorioFamiliarDesignado;
        public IEnumerable<Familiar_Designado> familiares {get; set;}
        public ListFamiliarModel(IRepositorioFamiliarDesignado repositorio){
            this.repositorioFamiliarDesignado = repositorio;
        }
        public void OnGet()
        {
            familiares = repositorioFamiliarDesignado.getAllFamiliarDesignados();
        }
    }
}
