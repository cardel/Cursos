using HospitalEnCasa.app.Dominio;
using System.Collections.Generic;
using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioCita : IRepositorioCita{
        private readonly Contexto _contexto;

        public RepositorioCita(Contexto contexto){
            this._contexto = contexto;
        }
        public IEnumerable<Cita> GetAllCitas(){
            return this._contexto.Citas.Include("Medico").Include("Paciente");
        }
        public Cita GetCita(int Id){
            return this._contexto.Citas.Include("Medico").Include("Paciente").FirstOrDefault(c => c.Id == Id);
        }
        public Cita AddCita(Cita cita){
            /*
            1) El medico no debe tener una cita entre la hora de cita y 30 minutos después
            2) Una sala no puede tener una cita al mismo tiempo
            */
            Cita citaCruzada = _contexto.Citas.FirstOrDefault(
                c => c.Medico.Id == cita.Medico.Id &&
                cita.Dia == c.Dia &&
                cita.Hora >= c.Hora &&
                cita.Hora < c.Hora.AddMinutes(30)                
                );

            Cita citaEspacio = _contexto.Citas.FirstOrDefault(
                c => c.Sala == cita.Sala &&
                cita.Dia == c.Dia &&
                cita.Hora >= c.Hora &&
                cita.Hora < c.Hora.AddMinutes(30)                
                );

            Cita citaPaciente = _contexto.Citas.FirstOrDefault(
                c => c.Paciente.Id == cita.Paciente.Id &&
                cita.Dia == c.Dia &&
                cita.Hora >= c.Hora &&
                cita.Hora < c.Hora.AddMinutes(30)                
                );

            if(citaEspacio == null && citaCruzada == null && citaPaciente == null){
                Cita nuevaCita = _contexto.Add(cita).Entity;
                _contexto.SaveChanges();
                return nuevaCita;                
            }
            else{
                return null;
            }


        }        
    }
}