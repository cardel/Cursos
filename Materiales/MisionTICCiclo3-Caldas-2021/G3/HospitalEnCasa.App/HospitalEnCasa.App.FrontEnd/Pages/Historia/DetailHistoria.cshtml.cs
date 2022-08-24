using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Persistencia;
using HospitalEnCasa.app.Dominio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    [Authorize(Roles = "Paciente,Medico,Enfermera,Admin")]
    public class DetailHistoriaModel : PageModel
    {
        private readonly IRepositorioHistoria repositorioHistoria;
        public Historia Historia {get; set; }
        private readonly ILogger<DetailHistoriaModel> _logger;

        public DetailHistoriaModel(IRepositorioHistoria repositorio, ILogger<DetailHistoriaModel> logger){
            this.repositorioHistoria = repositorio;
            _logger = logger;
        }
        public void OnGet(int idHistoria)
        {
            _logger.LogInformation("Historia consultada");
            Historia = repositorioHistoria.getHistoria(idHistoria);
            
        }


    }
}
