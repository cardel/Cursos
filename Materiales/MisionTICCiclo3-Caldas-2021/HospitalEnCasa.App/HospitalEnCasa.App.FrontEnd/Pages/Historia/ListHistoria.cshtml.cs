using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HospitalEnCasa.App.FrontEnd
{
    public class ListHistoriaModel : PageModel
    {
        private readonly IRepositorioHistoria repositorioHistoria;
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioEnfermera repositorioEnfermera;

        public SelectList medicos { get; set; }
        public SelectList enfermeras { get; set; }
        public SelectList pacientes { get; set; }

        public int cedula {get; set;}

        public string tipo {get; set;}

        public ListHistoriaModel(IRepositorioHistoria repositorio, IRepositorioEnfermera repositorioEnfermera, IRepositorioPaciente repositorioPaciente, IRepositorioMedico repositorioMedico){
            repositorioHistoria = repositorio;
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioMedico = repositorioMedico;
            this.repositorioEnfermera = repositorioEnfermera;
            medicos = new SelectList(repositorioMedico.getMedicos(),nameof(Medico.cedula),nameof(Medico.nombre));
            enfermeras = new SelectList(repositorioEnfermera.getAllEnfermeras(),nameof(Enfermera.cedula),nameof(Enfermera.nombre));
            pacientes = new SelectList(repositorioPaciente.obtenerPacientes(),nameof(Paciente.cedula),nameof(Paciente.nombre));

        }
        public void OnGet()
        {
        }
    }
}
