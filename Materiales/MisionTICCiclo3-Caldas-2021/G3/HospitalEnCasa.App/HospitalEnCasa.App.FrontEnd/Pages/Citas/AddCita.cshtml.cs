using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class AddCitaModel : PageModel
    {
        private readonly IRepositorioCita repositorioCita;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioPaciente repositorioPaciente;

        public Cita cita { get; set; }
        public SelectList medicos { get; set; }
        public SelectList pacientes { get; set; }

        public int cedulaMedico { get; set; }
        public int cedulaPaciente { get; set; }

        public string mensaje {get; set; }

        public AddCitaModel(IRepositorioCita repositorioCita, IRepositorioMedico repositorioMedico, IRepositorioPaciente repositorioPaciente){
            this.repositorioMedico = repositorioMedico;
            this.repositorioCita = repositorioCita;
            this.repositorioPaciente = repositorioPaciente;

            medicos = new SelectList(repositorioMedico.getAllMedicos(),nameof(Medico.cedula),nameof(Medico.nombre));
            pacientes = new SelectList(repositorioPaciente.getAllPacientes(),nameof(Paciente.cedula),nameof(Paciente.nombre));
        }
        
        public void OnGet()
        {
        }

        public IActionResult OnPost(Cita cita, int cedulaMedico, int cedulaPaciente){
            if(ModelState.IsValid){
                Medico medico = repositorioMedico.getMedico(cedulaMedico);
                Paciente paciente = repositorioPaciente.getPaciente(cedulaPaciente);

                Cita nuevaCita = new Cita(){
                    medico = medico,
                    paciente = paciente,
                    descripcion = cita.descripcion,
                    sala = cita.sala,
                    dia = cita.dia,
                    hora = cita.hora
                };

                Cita citaResultante = repositorioCita.addCita(nuevaCita);

                if(citaResultante== null){
                    mensaje = "El médico tiene una cita a la misma hora, seleccione otra";
                    return Page();
                }
                else{
                    return RedirectToPage("./ListCita");
                }
            }
            else{
                return Page();
            }
        }
    }
}
