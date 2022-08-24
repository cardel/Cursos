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
    public class MedicosController : ControllerBase
    {
        private readonly ILogger<MedicosController> _logger;
        private readonly IRepositorioMedico repositorioMedico;

        public MedicosController(ILogger<MedicosController> logger,IRepositorioMedico repositorioMedico)
        {
            _logger = logger;
            this.repositorioMedico = repositorioMedico;
        }

        [HttpGet]
        public IEnumerable<Medico> Get()
        {
            _logger.LogInformation("Consultando todos los médicos");
            return repositorioMedico.getAllMedicos();
        }

        [HttpGet("cedula/{cedula}")]
        public Medico Get(int cedula){
            _logger.LogInformation("Consultado el médico con cedula "+cedula);
            return repositorioMedico.getMedico(cedula);            
        }
    }
}
