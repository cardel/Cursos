using System;
using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioHistoria : IRepositorioHistoria
    {
        private readonly Contexto _contexto;

        public RepositorioHistoria(Contexto contexto){
            this._contexto = contexto;
        }
        
        public Historia addHistoria(Historia historia)
        {
            Historia historiaNueva = _contexto.Add(historia).Entity;
            _contexto.SaveChanges();
            return historiaNueva;
        }

        public Historia editHistoria(Historia historia)
        {
            Historia historiaAEditar = _contexto.Historias.FirstOrDefault(h => h.Id == historia.Id);
            if(historiaAEditar != null){
                historiaAEditar.anotaciones = historia.anotaciones;
                historiaAEditar.descripcion = historia.descripcion;
                _contexto.SaveChanges();
            }
            return historiaAEditar;
        }

        public IEnumerable<Historia> getAllHistoria()
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.enfermera").Include("anotaciones.paciente");
        }

        public Historia getHistoria(int Id)
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.enfermera").Include("anotaciones.paciente").FirstOrDefault(h => h.Id == Id);
        }

        public Historia getHistoriaByMedico(Medico medico)
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.enfermera").Include("anotaciones.paciente").FirstOrDefault(h => h.anotaciones.Any(a => a.medico.Id == medico.Id));

        }

        public Historia getHistoriaByMedicoFecha(Medico medico, DateTime inicial, DateTime final)
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.enfermera").Include("anotaciones.paciente").FirstOrDefault(h => h.anotaciones.All(a => a.medico.Id == medico.Id && a.fecha >= inicial && a.fecha <= final));

        }

        public Historia getHistoriaByPaciente(Paciente paciente)
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.enfermera").Include("anotaciones.paciente").FirstOrDefault(h => h.anotaciones.Any(a => a.paciente.Id == paciente.Id));
        }

        public void removeHistoria(int Id)
        {
            Historia historia = _contexto.Historias.FirstOrDefault(x => x.Id == Id);
            if(historia != null){
                _contexto.Historias.Remove(historia);
                _contexto.SaveChanges();
            }
        }
    }
}