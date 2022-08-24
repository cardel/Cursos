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
    public class DetailHistoriaByUser : PageModel
    {
        private readonly IRepositorioHistoria repositorioHistoria;
        public Historia Historia {get; set; }
        private readonly ILogger<DetailHistoriaModel> _logger;

        public DetailHistoriaByUser(IRepositorioHistoria repositorio, ILogger<DetailHistoriaModel> logger){
            this.repositorioHistoria = repositorio;
            _logger = logger;
        }
        public void OnGet(string username)
        {
            _logger.LogInformation("Historia consultada para usuario "+username);
            Historia = repositorioHistoria.getHistoriaByUser(username);        
            
        }


    }
}
