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
            Historia historiaNueva =  _contexto.Add(historia).Entity;
            _contexto.SaveChanges();
            return historiaNueva;
        }

        public Historia editHistoria(Historia historia)
        {
            Historia historiaAEditar = _contexto.historias.FirstOrDefault(p => p.Id == historia.Id);
            if(historiaAEditar != null){
                historiaAEditar.anotaciones = historia.anotaciones;
                historiaAEditar.descripcion = historia.descripcion;
                _contexto.SaveChanges();

            }
            return historiaAEditar;
        }

        public IEnumerable<Historia> getAllHistoria()
        {
            return _contexto.historias.Include("anotaciones").Include("anotaciones.paciente").Include("anotaciones.medico").Include("anotaciones.enfermera").Include("anotaciones.signoVital");
        }

        public Historia getHistoria(int id)
        {
            return _contexto.historias.Include("anotaciones").Include("anotaciones.paciente").Include("anotaciones.signoVital").Include("anotaciones.medico").Include("anotaciones.enfermera").FirstOrDefault(h => h.Id == id);
        }
        public Historia getHistoriaByUser(string username)
        {
            return _contexto.historias.Include("anotaciones").Include("anotaciones.paciente").Include("anotaciones.signoVital").Include("anotaciones.medico").Include("anotaciones.enfermera").FirstOrDefault(h => h.anotaciones.Any(a=> a.paciente.username.ToLower() == username.ToLower()));
        }
        public IEnumerable<Historia> historiaPorEnfermera(Enfermera enfermera)
        {
            return _contexto.historias.Where(h => h.anotaciones.Any(a => a.enfermera.Id == enfermera.Id));
 
        }

        public Historia historiaPorFechaYPaciente(DateTime fecha_inicio, DateTime fecha_final, Paciente paciente)
        {
            return _contexto.historias.FirstOrDefault(h => h.anotaciones.Any(a => a.paciente.Id == paciente.Id && a.fecha >= fecha_inicio && a.fecha <= fecha_final));
        }

        public IEnumerable<Historia>  historiaPorMedico(Medico medico)
        {
            return _contexto.historias.Where(h => h.anotaciones.Any(a => a.medico.Id == medico.Id));
        }

        public Historia historiaPorPaciente(Paciente paciente)
        {
            return _contexto.historias.FirstOrDefault(h => h.anotaciones.All(a => a.paciente.Id == paciente.Id));
            
        }

        public void RemoveHistoria(int id)
        {
            Historia historiaAEliminar = _contexto.historias.FirstOrDefault(p => p.Id == id);
            if(historiaAEliminar != null){
                _contexto.historias.Remove(historiaAEliminar);
                _contexto.SaveChanges();
            }
        }


    }
}