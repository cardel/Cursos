using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioAnotacion : IRepositorioAnotacion
    {
        private readonly Contexto _contexto;
        public RepositorioAnotacion(Contexto context){
            this._contexto = context;
        }
        public Anotacion addAnotacion(Anotacion anotacion)
        {
            Anotacion anotacionNew = _contexto.Add(anotacion).Entity;
            _contexto.SaveChanges();
            return anotacionNew;
        }

        public Anotacion editAnotacion(Anotacion anotacion)
        {
            Anotacion anotacionAEditar = _contexto.anotaciones.FirstOrDefault(a => a.Id == anotacion.Id);
            if(anotacionAEditar != null){
                anotacionAEditar.descripcion = anotacion.descripcion;
                anotacionAEditar.enfermera = anotacion.enfermera;
                anotacionAEditar.medico = anotacion.medico;
                anotacionAEditar.paciente = anotacion.paciente;
                anotacionAEditar.signoVital = anotacion.signoVital;
                anotacionAEditar.fecha = anotacion.fecha;
                _contexto.SaveChanges();
            }
            return anotacionAEditar;
        }

        public IEnumerable<Anotacion> getAllAnotacion()
        {
            return _contexto.anotaciones.Include("paciente").Include("enfermera").Include("medico");
        }

        public Anotacion getAnotacionById(int id)
        {
            return _contexto.anotaciones.Include("paciente").Include("enfermera").Include("medico").FirstOrDefault(a => a.Id == id);
        }

        public void removeAnotacion(int id)
        {
            Anotacion anotacion = _contexto.anotaciones.FirstOrDefault(a => a.Id == id);
            if(anotacion != null){
                _contexto.anotaciones.Remove(anotacion);
                _contexto.SaveChanges();
            }
        }
    }
}