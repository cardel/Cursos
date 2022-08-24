using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace HospitalEnCasa.app.Servicios.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HistoriasController : ControllerBase
    {

        private readonly ILogger<HistoriasController> _logger;
        private readonly IRepositorioHistoria repositorioHistoria;
        public HistoriasController(ILogger<HistoriasController> logger,IRepositorioHistoria repositorioHistoria)
        {
            _logger = logger;
            this.repositorioHistoria = repositorioHistoria;
        }

        [HttpGet]
        public IEnumerable<Historia> Get()
        {
            return repositorioHistoria.getAllHistorias();
        }
    }
}
