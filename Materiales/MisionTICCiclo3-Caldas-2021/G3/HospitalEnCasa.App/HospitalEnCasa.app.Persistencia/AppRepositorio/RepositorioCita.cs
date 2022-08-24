using System;
using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioCita : IRepositorioCita
    {
        private readonly Contexto _contexto;

        public RepositorioCita(Contexto contexto){
            this._contexto = contexto;
        }
        public Cita addCita(Cita cita)
        {
            Cita citacruzada = _contexto.Citas.FirstOrDefault(c=> c.dia == cita.dia && cita.hora >= c.hora && cita.hora < c.hora.AddMinutes(30) && c.medico.Id == cita.medico.Id );

            if(citacruzada == null){
                _contexto.Citas.Add(cita);
                _contexto.SaveChanges();
                return cita;
            }
            else{
                return null;
            }
        }
        public IEnumerable<Cita> getAllCitas()
        {
            return _contexto.Citas.Include("paciente").Include("medico");
        }

        public IEnumerable<Cita> getCitasPerDay(DateTime dia)
        {
            return _contexto.Citas.Where(c => c.dia == dia).Include("paciente").Include("medico");
        }

        public int ReportCitas(DateTime dia){
            int report = _contexto.Citas.Where(c => c.dia == dia).Count();
            return report;
        }
    }
}