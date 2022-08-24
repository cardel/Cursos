using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class AddAnotacionModel : PageModel
    {
        private readonly IRepositorioAnotacion repositorioAnotacion;
        private readonly IRepositorioSignoVital repositorioSignoVital;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioEnfermera repositorioEnfermera;
        private readonly IRepositorioPaciente repositorioPaciente;
        private readonly IRepositorioHistoria repositorioHistoria;
        public SignoVital signosVital { get; set; }
        public Anotacion anotacion { get; set; }

        public SelectList  medicos { get; set; }
        public SelectList enfermeras { get; set; }
        public SelectList pacientes { get; set; }

        public int cedulaMedico { get; set; }
        public int cedulaEnfermera { get; set; }
        public int cedulaPaciente { get; set; }

        public AddAnotacionModel(IRepositorioAnotacion repositorioAnotacion, IRepositorioSignoVital sign, IRepositorioMedico repositorioMedico, IRepositorioEnfermera repositorioEnfermera, IRepositorioPaciente repositorioPaciente,IRepositorioHistoria repositorioHistoria)
        {
            this.repositorioAnotacion = repositorioAnotacion;
            this.repositorioSignoVital = sign;
            this.repositorioMedico = repositorioMedico;
            this.repositorioEnfermera = repositorioEnfermera;
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioHistoria = repositorioHistoria;
            signosVital = new SignoVital();
            anotacion = new Anotacion();

            generarListas();

        }

        public void generarListas()
        {
            medicos = new SelectList(repositorioMedico.getMedicos(),nameof(Medico.cedula),nameof(Medico.nombre));
            enfermeras = new SelectList(repositorioEnfermera.getAllEnfermeras(),nameof(Enfermera.cedula),nameof(Enfermera.nombre));
            pacientes = new SelectList(repositorioPaciente.obtenerPacientes(),nameof(Paciente.cedula),nameof(Paciente.nombre));

        }
        public void OnGet()
        {
        }

        public IActionResult OnPost(Anotacion anotacion, int cedulaMedico, int cedulaPaciente, int cedulaEnfermera, SignoVital signosVital)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Medico medico = repositorioMedico.obtenerMedico(cedulaMedico);
                    Enfermera enfermera = repositorioEnfermera.getEnfermera(cedulaEnfermera);
                    Paciente paciente = repositorioPaciente.obtenerPaciente(cedulaPaciente);
    
                    Anotacion anotacionNueva = new Anotacion(){
                        medico = medico,
                        enfermera = enfermera,
                        paciente = paciente,
                        fecha = anotacion.fecha,
                        descripcion = anotacion.descripcion,
                        signosVital = signosVital,
                    };

                    Historia historia = repositorioHistoria.getHistoriaByPaciente(paciente);

                    if(historia==null){
                        Historia historiaNueva = new Historia(){
                            anotaciones = new List<Anotacion>{anotacionNueva},
                            descripcion = "Generada :"+DateTime.Now+" Paciente: "+paciente.nombre
                        };
                        repositorioHistoria.addHistoria(historiaNueva);
                    }else{
                        Historia historiaAEditar = repositorioHistoria.getHistoria(historia.Id);
                        List<Anotacion> lanotaciones = historiaAEditar.anotaciones;
                        lanotaciones.Add(anotacionNueva);
                        historiaAEditar.anotaciones = lanotaciones;
                        repositorioHistoria.editHistoria(historiaAEditar);

                    }

                    return RedirectToPage("./ListAnotacion");

                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
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
