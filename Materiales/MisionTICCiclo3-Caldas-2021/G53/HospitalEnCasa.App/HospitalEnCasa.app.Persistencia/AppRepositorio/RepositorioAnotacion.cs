using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioAnotacion : IRepositorioAnotacion
    {
        private readonly Contexto _contexto;

        public RepositorioAnotacion(Contexto contexto){
            this._contexto = contexto;
        }
        public Anotacion addAnotacion(Anotacion anotacion)
        {
            Anotacion anotacionNueva = _contexto.Add(anotacion).Entity;
            _contexto.SaveChanges();
            return anotacionNueva;
        }

        public Anotacion editAnotacion(Anotacion anotacion)
        {
            Anotacion anotacionAEditar = _contexto.Anotaciones.FirstOrDefault(a => a.Id == anotacion.Id);
            if (anotacionAEditar != null){
                anotacionAEditar.paciente = anotacion.paciente;
                anotacionAEditar.medico = anotacion.medico;
                anotacionAEditar.enfermera = anotacion.enfermera;
                anotacionAEditar.descripcion = anotacion.descripcion;
                anotacionAEditar.fecha = anotacion.fecha;
                _contexto.SaveChanges();
            }
            return anotacionAEditar;
        }

        public IEnumerable<Anotacion> getAllAnotacion()
        {
            return _contexto.Anotaciones.Include("medico").Include("paciente").Include("enfermera");
        }

        public Anotacion getAnotacion(int Id)
        {
            return _contexto.Anotaciones.Include("medico").Include("paciente").Include("enfermera").FirstOrDefault(a => a.Id == Id);
        }

        public void removeAnotacion(int Id)
        {
            Anotacion anotacion = _contexto.Anotaciones.FirstOrDefault(a => a.Id == Id);
            if(anotacion != null){
                _contexto.Anotaciones.Remove(anotacion);
                _contexto.SaveChanges();
            }
        }
    }
}