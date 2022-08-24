using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class AddCitaModel : PageModel
    {
        private readonly IRepositorioCita repositorioCita;
        private readonly IRepositorioMedico repositorioMedico;
        private readonly IRepositorioPaciente repositorioPaciente;

        public SelectList Medicos { get; set; }
        public SelectList Pacientes { get; set; }

        public int CedulaMedico { get; set; }
        public int CedulaPaciente { get; set; }
        public Cita Cita { get; set; }
        public String Mensaje { get; set; }

        public AddCitaModel(IRepositorioCita repositorioCita, IRepositorioMedico repositorioMedico, IRepositorioPaciente repositorioPaciente){
            this.repositorioCita = repositorioCita;
            this.repositorioPaciente = repositorioPaciente;
            this.repositorioMedico = repositorioMedico;

            Medicos = new SelectList(repositorioMedico.getMedicos(),nameof(Medico.cedula),nameof(Medico.nombre));
            Pacientes = new SelectList(repositorioPaciente.obtenerPacientes(),nameof(Paciente.cedula),nameof(Paciente.nombre));
            Cita = new Cita();
        }
        public void OnGet()
        {
        }
        public IActionResult OnPost(Cita Cita, int CedulaPaciente, int CedulaMedico){
            Medico medico = repositorioMedico.obtenerMedico(CedulaMedico);
            Paciente paciente = repositorioPaciente.obtenerPaciente(CedulaPaciente);

            Cita nuevaCita = new Cita(){
                Paciente = paciente,
                Medico = medico,
                Hora = Cita.Hora,
                Dia = Cita.Dia,
                Descripcion = Cita.Descripcion,
                Sala = Cita.Sala,
            };

            if(ModelState.IsValid){
                Cita citaInsertada = repositorioCita.AddCita(nuevaCita);
                if(citaInsertada!=null){
                    return RedirectToPage("./ListCita");
                }
                else{
                    Mensaje = "El medico tiene una cita a esa hora o la sala está ocupada en ese momento";
                    return Page();
                }
            }
            else{
                return Page();
            }
        }
    }
}
