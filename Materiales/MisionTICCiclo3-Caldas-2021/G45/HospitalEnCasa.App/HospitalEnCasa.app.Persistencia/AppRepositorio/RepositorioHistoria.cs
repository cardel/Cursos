using System;
using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioHistoria : IRepositorioHistoria
    {
        private readonly Contexto _contexto;
        public RepositorioHistoria(Contexto context){
            this._contexto = context;
        }
        public Historia addHistoria(Historia historia)
        {
            Historia historiaNueva = _contexto.Add(historia).Entity;
            _contexto.SaveChanges();
            return historiaNueva;
        }

        public Historia editHistoria(Historia historia)
        {
            Historia historiaEncontrada = _contexto.Historias.FirstOrDefault(h => h.Id == historia.Id);
            if(historiaEncontrada != null){
                historiaEncontrada.anotaciones = historia.anotaciones;
                historiaEncontrada.descripcion = historia.descripcion;
                _contexto.SaveChanges();
            }
            return historiaEncontrada;
        }

        public IEnumerable<Historia> getAllHistorias()
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.paciente").Include("anotaciones.enfermera").Include("anotaciones.signosVital");
        }

        public Historia getHistoria(int Id)
        {
            return _contexto.Historias.FirstOrDefault(h => h.Id == Id);
        }

        public IEnumerable<Historia> getHistoriaByMedico(Medico medico)
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.paciente").Include("anotaciones.enfermera").Include("anotaciones.signosVital").Where(h => h.anotaciones.Any(a => a.medico.Id == medico.Id));

        }

        public IEnumerable<Historia> getHistoriaByPaciente(Paciente paciente)
        {
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.paciente").Include("anotaciones.enfermera").Include("anotaciones.signosVital").Where(h => h.anotaciones.All(a=>a.paciente.Id == paciente.Id));
        }
        public  IEnumerable<Historia> getHistoriaByEnfermera(Enfermera enfermera){
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.paciente").Include("anotaciones.enfermera").Include("anotaciones.signosVital").Where(h => h.anotaciones.Any(a=>a.enfermera.Id == enfermera.Id));
        }

        public void RemoveHistoria(int Id)
        {
            Historia historiaEncontrada = _contexto.Historias.FirstOrDefault(h => h.Id == Id);
            if(historiaEncontrada != null){
                _contexto.Historias.Remove(historiaEncontrada);
                _contexto.SaveChanges();
            }
        }

        public Historia getHistoriaByOnePaciente(Paciente Paciente){
            return _contexto.Historias.Include("anotaciones").Include("anotaciones.medico").Include("anotaciones.paciente").Include("anotaciones.enfermera").Include("anotaciones.signosVital").FirstOrDefault(h => h.anotaciones.All(a=>a.paciente.Id == Paciente.Id));

        }
    }
}