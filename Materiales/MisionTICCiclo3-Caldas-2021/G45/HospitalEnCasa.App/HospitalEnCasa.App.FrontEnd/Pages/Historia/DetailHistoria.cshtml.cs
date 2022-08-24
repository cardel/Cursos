using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd
{
    public class DetailHistoriaModel : PageModel
    {
        private readonly IRepositorioEnfermera repositorioEnfermera;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioHistoria repositorioHistoria;

        public string Tipo { get; set; }
        public Medico Medico {get; set; }
        public Enfermera Enfermera { get; set; }
        public Paciente Paciente { get; set;}

        public IEnumerable<Historia> Historias { get; set;}

        public DetailHistoriaModel(IRepositorioMedico repositorioMedico, IRepositorioEnfermera repositorioEnfermera, IRepositorioPaciente repositorioPaciente,IRepositorioHistoria repositorioHistoria){
            this.repositorioMedico = repositorioMedico;
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioEnfermera = repositorioEnfermera;
            this.repositorioHistoria = repositorioHistoria;
        }
        public void OnGet(int cedula, string tipo)
        {
            if(tipo=="paciente"){
                Paciente = repositorioPaciente.obtenerPaciente(cedula);
                Historias = repositorioHistoria.getHistoriaByPaciente(Paciente);
            }
            else{
                if(tipo=="medico"){
                    Medico = repositorioMedico.obtenerMedico(cedula);
                    Historias = repositorioHistoria.getHistoriaByMedico(Medico);
                }
                else{
                    Enfermera = repositorioEnfermera.getEnfermera(cedula);
                    Historias = repositorioHistoria.getHistoriaByEnfermera(Enfermera);
                }
            }

            this.Tipo = tipo;
        }
    }
}
