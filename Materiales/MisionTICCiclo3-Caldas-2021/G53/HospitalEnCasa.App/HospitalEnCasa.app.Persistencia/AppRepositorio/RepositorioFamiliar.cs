using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;

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
            familiar.password = security.GetMD5Hash(familiar.password);
            Familiar familiarNuevo = _contexto.Add(familiar).Entity;
            _contexto.SaveChanges();
            return familiarNuevo;
        }

        public Familiar editFamiliar(Familiar familiar)
        {
            familiar.password = security.GetMD5Hash(familiar.password);
            Familiar familiarAEditar = _contexto.Familiares.FirstOrDefault(f => f.Id == familiar.Id);
            if (familiarAEditar != null){
                familiarAEditar.cedula = familiar.cedula;
                familiarAEditar.nombre = familiar.nombre;
                familiarAEditar.edad = familiar.edad;
                familiarAEditar.genero = familiar.genero;
                familiarAEditar.direccion = familiar.direccion;
                familiarAEditar.longitud = familiar.longitud;
                familiarAEditar.latitud = familiar.latitud;
                familiarAEditar.username = familiar.username;
                familiarAEditar.password = familiar.password;
                familiarAEditar.email = familiar.email;
                _contexto.SaveChanges();
            }
            return familiarAEditar;
        }

        public IEnumerable<Familiar> getAllFamiliares()
        {
            return _contexto.Familiares;
        }

        public Familiar getFamiliar(int cedula)
        {
            return _contexto.Familiares.FirstOrDefault(x => x.cedula == cedula);
        }

        public void removeFamiliar(int cedula)
        {
            Familiar familiar = _contexto.Familiares.FirstOrDefault(x => x.cedula == cedula);
            if(familiar != null){
                _contexto.Familiares.Remove(familiar);
                _contexto.SaveChanges();
            }
        }
    }
}