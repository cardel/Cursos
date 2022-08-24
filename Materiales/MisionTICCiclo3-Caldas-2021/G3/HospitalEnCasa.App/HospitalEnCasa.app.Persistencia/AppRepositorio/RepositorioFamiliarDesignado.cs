using System;
using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia
{
    public class RepositorioFamiliarDesignado : IRepositorioFamiliarDesignado
    {
        private readonly Contexto _contexto;
        private readonly Security security;

        public RepositorioFamiliarDesignado(Contexto context)
        {
            this._contexto = context;
            this.security = new Security();
        }
        public Familiar_Designado addFamiliarDesignado(Familiar_Designado familiar)
        {
            String password = familiar.password;
            password = security.GetMD5Hash(password);
            familiar.password = password;
            Familiar_Designado familiarNew = _contexto.Add(familiar).Entity;
            _contexto.SaveChanges();
            return familiarNew;
        }

        public Familiar_Designado editFamiliarDesignado(Familiar_Designado familiar)
        {
            String password = familiar.password;
            password = security.GetMD5Hash(password);
            familiar.password = password;
            Familiar_Designado familiarAEditar = _contexto.Familiares_Designados.FirstOrDefault(f => f.Id == familiar.Id);
            if (familiarAEditar != null)
            {
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

        public IEnumerable<Familiar_Designado> getAllFamiliarDesignados()
        {
            return _contexto.Familiares_Designados;
        }

        public Familiar_Designado getFamiliarDesignado(int cedula)
        {
            Familiar_Designado familiar = _contexto.Familiares_Designados.FirstOrDefault(p => p.cedula == cedula);
            return familiar;
        }

        public void RemoveFamiliarDesignado(int cedula)
        {
            Familiar_Designado familiar = _contexto.Familiares_Designados.FirstOrDefault(p => p.cedula == cedula);
            if (familiar != null)
            {
                _contexto.Familiares_Designados.Remove(familiar);
                _contexto.SaveChanges();
            }
        }
    }
}