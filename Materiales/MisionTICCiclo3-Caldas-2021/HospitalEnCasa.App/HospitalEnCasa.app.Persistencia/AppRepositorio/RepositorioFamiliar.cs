using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioFamiliar : IRepositorioFamiliar
    {
        private readonly Contexto _contexto;
        private readonly Security security;
        public RepositorioFamiliar(Contexto context){
            this._contexto = context;
            security = new Security();
        }
        public Familiar addFamiliar(Familiar familiar)
        {
            familiar.username = familiar.username.ToLower() ;
            familiar.password = security.GetMD5Hash(familiar.password);
            Familiar familiarNuevo = _contexto.Add(familiar).Entity;
            _contexto.SaveChanges();
            return familiarNuevo;
        }

        public Familiar editFamiliar(Familiar familiar)
        {
            familiar.password = security.GetMD5Hash(familiar.password);
            familiar.username = familiar.username.ToLower() ;
            Familiar familiarEncontrado =  _contexto.Familiares.FirstOrDefault(f => f.Id == familiar.Id);
            if(familiarEncontrado != null){
                familiarEncontrado.cedula = familiar.cedula;
                familiarEncontrado.nombre = familiar.nombre;
                familiarEncontrado.edad = familiar.edad;
                familiarEncontrado.genero = familiar.genero;
                familiarEncontrado.direccion =  familiar.direccion;
                familiarEncontrado.longitud = familiar.longitud;
                familiarEncontrado.latitud = familiar.latitud;
                familiarEncontrado.username = familiar.username;
                familiarEncontrado.password = familiar.password;
                familiarEncontrado.email = familiar.email;
                _contexto.SaveChanges();
            }
            return familiarEncontrado;
        }

        public IEnumerable<Familiar> getAllFamiliares()
        {
            return _contexto.Familiares;
        }

        public Familiar getFamiliar(int cedula)
        {
            Familiar familiarEncontrado = _contexto.Familiares.FirstOrDefault(p => p.cedula == cedula);
            return familiarEncontrado;
        }

        public void RemoveFamiliar(Familiar familiar)
        {
            Familiar familiarEncontrado =  _contexto.Familiares.FirstOrDefault(f => f.Id == familiar.Id);
            if(familiarEncontrado != null){        
                _contexto.Familiares.Remove(familiarEncontrado);
                _contexto.SaveChanges();
            }
        }
    }
}