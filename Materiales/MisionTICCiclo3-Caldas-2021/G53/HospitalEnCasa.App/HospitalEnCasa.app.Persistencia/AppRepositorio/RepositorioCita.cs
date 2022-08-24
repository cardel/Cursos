using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioCita : IRepositorioCita
    {
        private readonly Contexto _contexto;

        public RepositorioCita(Contexto contexto){
            this._contexto = contexto;
        }
        public Cita AddCita(Cita Cita)
        {
            /*
            Primera restriccion: Un médico no puede tener dos citas al mismo tiempo
            Idea. Buscar citas que tenga el médico a la misma hora
            */
            Cita citaMedico = _contexto.Citas.FirstOrDefault(c => c.Medico.Id == Cita.Medico.Id && c.Dia == Cita.Dia && Cita.Hora >= c.Hora && Cita.Hora < c.Hora.AddMinutes(30));
            /*
            Segunda restricción: Una sala no puede estar ocupada al mismo
            */
            Cita citaSala = _contexto.Citas.FirstOrDefault(c=> c.Sala == Cita.Sala && c.Dia == Cita.Dia && Cita.Hora >= c.Hora && Cita.Hora < c.Hora.AddMinutes(30));

            if(citaMedico == null && citaSala == null){
                Cita citaAgregada = _contexto.Citas.Add(Cita).Entity;
                _contexto.SaveChanges();
                return citaAgregada; //Si registramos la cita
            }
            else{
                return null; //Diciendo que NO puedo dar la cita
            }
        }

        public IEnumerable<Cita> GetAllCitas()
        {
            return _contexto.Citas.Include("Paciente").Include("Medico");
        }

        public Cita GetCita(int Id)
        {
            return _contexto.Citas.Include("Paciente").Include("Medico").FirstOrDefault(c => c.Id == Id);
        }
    }
}