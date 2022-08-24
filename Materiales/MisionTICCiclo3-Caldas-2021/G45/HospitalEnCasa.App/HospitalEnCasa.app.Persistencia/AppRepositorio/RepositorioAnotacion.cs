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
            Anotacion anotacionNueva = _contexto.Add(anotacion).Entity;
            _contexto.SaveChanges();
            return anotacionNueva;

        }

        public Anotacion editAnotacion(Anotacion anotacion)
        {
            Anotacion anotacionEncontrada = _contexto.Anotaciones.FirstOrDefault(a => a.Id == anotacion.Id);
            if(anotacionEncontrada!= null){
                anotacionEncontrada.descripcion = anotacion.descripcion;
                anotacionEncontrada.enfermera = anotacion.enfermera;
                anotacionEncontrada.medico = anotacion.medico;
                anotacionEncontrada.paciente = anotacion.paciente;
                anotacionEncontrada.signosVital = anotacion.signosVital;
            }
            return anotacionEncontrada;
        }

        public IEnumerable<Anotacion> getAllAnotacion()
        {
            return _contexto.Anotaciones.Include("medico").Include("paciente").Include("enfermera").Include("signosVital");
        }

        public Anotacion getAnotacion(int Id)
        {
            return _contexto.Anotaciones.Include("medico").Include("paciente").Include("enfermera").Include("signosVital").FirstOrDefault(a => a.Id == Id);
        }

        public void removeAnotacion(Anotacion anotacion)
        {
            Anotacion anotacionEncontrada = _contexto.Anotaciones.FirstOrDefault(a => a.Id == anotacion.Id);
            if(anotacionEncontrada != null){
                _contexto.Anotaciones.Remove(anotacionEncontrada);
                _contexto.SaveChanges();
            }

        }
    }
}