using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioEnfermera : IRepositorioEnfermera
    {
        private readonly Contexto _contexto;
        private readonly Security security;

        public RepositorioEnfermera(Contexto contexto){
            this._contexto = contexto;
            security = new Security();
        }
        public Enfermera addEnfermera(Enfermera enfermera)
        {
            enfermera.password= security.GetMD5Hash(enfermera.password);
            enfermera.username = enfermera.username.ToLower() ;
            Enfermera enfermeraNueva = _contexto.Add(enfermera).Entity;
            _contexto.SaveChanges();
            return enfermeraNueva;
        }

        public Enfermera editEnfermera(Enfermera enfermera)
        {
            enfermera.password= security.GetMD5Hash(enfermera.password);
            enfermera.username = enfermera.username.ToLower() ;
            
            Enfermera enfermeraEncontrada = _contexto.Enfermeras.FirstOrDefault(e => e.Id == enfermera.Id);
            if(enfermeraEncontrada != null){
                enfermeraEncontrada.cedula = enfermera.cedula;
                enfermeraEncontrada.nombre = enfermera.nombre;
                enfermeraEncontrada.edad = enfermera.edad;
                enfermeraEncontrada.genero = enfermera.genero;
                enfermeraEncontrada.hospital =  enfermera.hospital;
                enfermeraEncontrada.descripcion = enfermera.descripcion;
                enfermeraEncontrada.username = enfermera.username;
                enfermeraEncontrada.password = enfermera.password;
                enfermeraEncontrada.email = enfermera.email;
                _contexto.SaveChanges();
            }
            return enfermeraEncontrada;
        }

        public IEnumerable<Enfermera> getAllEnfermeras()
        {
            return _contexto.Enfermeras;
        }

        public Enfermera getEnfermera(int cedula)
        {
            Enfermera enfermeraEncontrada = _contexto.Enfermeras.FirstOrDefault(e => e.cedula == cedula);
            return enfermeraEncontrada;
        }

        public void RemoveEnfermera(int cedula)
        {
            Enfermera enfermeraEncontrada = _contexto.Enfermeras.FirstOrDefault(e => e.cedula == cedula);
            if(enfermeraEncontrada != null){
                _contexto.Enfermeras.Remove(enfermeraEncontrada);
                _contexto.SaveChanges();
            }
        }
    }
}