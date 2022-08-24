using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HospitalEnCasa.App.FrontEnd
{
   [Authorize(Roles = "Medico,Enfermera,Admin")]
    public class AddAnotacionModel : PageModel
    {
        private readonly IRepositorioAnotacion repositorioAnotacion;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioEnfermera repositorioEnfermera;
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioHistoria repositorioHistoria;

        public IEnumerable<SelectListItem> medicos { get; set; }
        public IEnumerable<SelectListItem> enfermeras { get; set; }
        public IEnumerable<SelectListItem> pacientes { get; set;}

        public Anotacion anotacion { get; set; }
        public SignoVital signoVital { get; set; }
        public int cedulaMedico { get; set; }
        public int cedulaEnfermera { get; set; }
        public int cedulaPaciente { get; set; }

        public AddAnotacionModel(IRepositorioAnotacion repositorioAnotacion, IRepositorioMedico repositorioMedico,IRepositorioPaciente repositorioPaciente,IRepositorioEnfermera repositorioEnfermera,IRepositorioHistoria repositorioHistoria){
            this.repositorioAnotacion = repositorioAnotacion;
            this.repositorioMedico = repositorioMedico;
            this.repositorioEnfermera = repositorioEnfermera;
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioHistoria = repositorioHistoria;

            medicos = repositorioMedico.getAllMedicos().Select(
                m => new SelectListItem{
                    Value = Convert.ToString(m.cedula),
                    Text = m.nombre
                }
            );
            pacientes = repositorioPaciente.getAllPacientes().Select(
                m => new SelectListItem{
                    Value = Convert.ToString(m.cedula),
                    Text = m.nombre
                }
            );
            enfermeras = repositorioEnfermera.getAllEnfermeras().Select(
                m => new SelectListItem{
                    Value = Convert.ToString(m.cedula),
                    Text = m.nombre
                }
            );

            anotacion = new Anotacion();
            signoVital = new SignoVital();
        }
        public void OnGet()
        {
        } 

        public IActionResult OnPost(Anotacion anotacion,int cedulaMedico,int cedulaEnfermera,int cedulaPaciente, SignoVital signoVital){
            if(ModelState.IsValid){

                Medico medico = repositorioMedico.getMedico(cedulaMedico);
                Enfermera enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);
                Paciente paciente = repositorioPaciente.getPaciente(cedulaPaciente);

                Anotacion anotacionNueva = new Anotacion(){
                    medico = medico,
                    enfermera = enfermera,
                    paciente = paciente,
                    fecha = anotacion.fecha,
                    descripcion = anotacion.descripcion,
                    signoVital = signoVital
                };

                Historia historia = repositorioHistoria.historiaPorPaciente(paciente);

                /*
                Si la persona tiene anotaciones quiere decir que tiene una historia clinica, si no debemos crearla
                */
                if(historia == null){
                    historia = new Historia(){
                        descripcion= "Fecha: "+DateTime.Now+" Paciente "+paciente.nombre,
                        anotaciones = new List<Anotacion>{anotacionNueva}
                    };
                    repositorioHistoria.addHistoria(historia);

                }else{
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
