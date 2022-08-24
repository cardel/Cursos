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
        public Cita Cita { get; set; }
        public SelectList Medicos { get; set; }
        public SelectList Pacientes { get; set; }

        public int CedulaMedico { get; set; }
        public int CedulaPaciente { get; set;}
        public string Mensaje { get; set; }

        public AddCitaModel(IRepositorioCita repositorioCita, IRepositorioMedico repositorioMedico, IRepositorioPaciente repositorioPaciente){
            this.repositorioCita = repositorioCita;
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioMedico = repositorioMedico;
            Cita = new Cita();
            Pacientes = new SelectList(repositorioPaciente.getAllPacientes(),nameof(Paciente.cedula),nameof(Paciente.nombre));
            Medicos = new SelectList(repositorioMedico.getAllMedicos(),nameof(Medico.cedula),nameof(Medico.nombre));
        }
        public IActionResult OnPost(Cita Cita, int CedulaPaciente, int CedulaMedico)
        {
            if(ModelState.IsValid){
                Medico Medico = repositorioMedico.getMedico(CedulaMedico);
                Paciente Paciente = repositorioPaciente.getPaciente(CedulaPaciente);

                Cita NuevaCita = new Cita(){
                    Medico = Medico,
                    Paciente = Paciente,
                    Hora = Cita.Hora,
                    Dia = Cita.Dia,
                    Sala = Cita.Sala
                };

                Cita CitaAgregada = repositorioCita.AddCita(NuevaCita);

                if(CitaAgregada == null){
                    Mensaje = "El médico tiene una cita a la misma hora o la sala está ocupada a esa hora";
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
