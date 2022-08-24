using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    [Authorize(Roles="Medico, Enfermera")]
    public class AddAnotacionModel : PageModel
    {
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioEnfermera repositorioEnfermera;
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioAnotacion repositorioAnotacion;
        private readonly IRepositorioHistoria repositorioHistoria;

        public SelectList medicos { get; set; }
        public SelectList enfermeras { get; set; }
        public SelectList pacientes { get; set; }
        public int cedulaPaciente { get; set;}
        public int cedulaMedico { get; set;}
        public int cedulaEnfermera { get; set; }

        public Anotacion anotacion { get; set; }
        public AddAnotacionModel(IRepositorioMedico repositorioMedico,IRepositorioEnfermera repositorioEnfermera, IRepositorioPaciente repositorioPaciente,IRepositorioHistoria repositorioHistoria, IRepositorioAnotacion repositorioAnotacion){
            this.repositorioAnotacion = repositorioAnotacion;
            this.repositorioMedico = repositorioMedico;
            this.repositorioEnfermera = repositorioEnfermera;
            this.repositorioHistoria = repositorioHistoria;
            this.repositorioPaciente = repositorioPaciente;

            medicos = new SelectList(repositorioMedico.getAllMedicos(),nameof(Medico.cedula),nameof(Medico.nombre));
            enfermeras = new SelectList(repositorioEnfermera.getEnfermeras(),nameof(Enfermera.cedula),nameof(Enfermera.nombre));
            pacientes = new SelectList(repositorioPaciente.getAllPacientes(),nameof(Paciente.cedula),nameof(Paciente.nombre));

            anotacion = new Anotacion();
            

        }
        public void OnGet()
        {
        }

        public IActionResult OnPost(Anotacion anotacion, int cedulaMedico, int cedulaPaciente, int cedulaEnfermera){
            if(ModelState.IsValid){
                Medico medico = repositorioMedico.getMedico(cedulaMedico);
                Enfermera enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);
                Paciente paciente = repositorioPaciente.getPaciente(cedulaPaciente);

                Anotacion anotacionNueva = new Anotacion(){
                    medico = medico,
                    enfermera = enfermera,
                    paciente = paciente,
                    fecha = anotacion.fecha,
                    descripcion = anotacion.descripcion
                };

                Historia historia = repositorioHistoria.getHistoriaByPaciente(paciente);
                if(historia==null){
                    historia = new Historia(){
                        serial = DateTime.Now.ToLongTimeString(),
                        descripcion = "Historia del paciente "+paciente.nombre,
                        anotaciones = new List<Anotacion>{anotacionNueva}
                    };
                    repositorioHistoria.addHistoria(historia);
                }
                else{
                    List<Anotacion> listaAnotaciones = historia.anotaciones;
                    listaAnotaciones.Add(anotacionNueva);
                    historia.anotaciones = listaAnotaciones;
                    repositorioHistoria.editHistoria(historia);
                }
                return RedirectToPage("./ListAnotacion");
            }
            else{
                return Page();
            }
        }
    }
}
