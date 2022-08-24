using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioPaciente : IRepositorioPaciente
    {
        private readonly Contexto _contexto;
        private readonly Security security;
        public RepositorioPaciente(Contexto contexto){
            _contexto = contexto;
            security = new Security();
        }
        public Paciente agregarPaciente(Paciente paciente)
        {
            paciente.username = paciente.username.ToLower() ;
            paciente.password = security.GetMD5Hash(paciente.password);
            Paciente pacienteAgregado = _contexto.Add(paciente).Entity;
            _contexto.SaveChanges();
            return pacienteAgregado;
        }

        public Paciente editarPaciente(Paciente paciente)
        {
            paciente.password = security.GetMD5Hash(paciente.password);
            paciente.username = paciente.username.ToLower() ;
            Paciente pacienteAEditar = _contexto.Pacientes.FirstOrDefault(c => c.Id == paciente.Id);
            if(pacienteAEditar!=null){
                pacienteAEditar.cedula = paciente.cedula;
                pacienteAEditar.edad = paciente.edad;
                pacienteAEditar.genero = paciente.genero;
                pacienteAEditar.latitud = paciente.latitud;
                pacienteAEditar.longitud = paciente.longitud;
                pacienteAEditar.medico = paciente.medico;
                pacienteAEditar.nombre = paciente.nombre;
                pacienteAEditar.familiar = paciente.familiar;
                pacienteAEditar.enfermera = paciente.enfermera;
                pacienteAEditar.username = paciente.username;
                pacienteAEditar.password = paciente.password;
                pacienteAEditar.email = paciente.email;
                pacienteAEditar.direccion = paciente.direccion;
                _contexto.SaveChanges();
            }
            return pacienteAEditar;
        }

        public void eliminarPaciente(int cedula)
        {
            Paciente pacienteAEliminar = _contexto.Pacientes.FirstOrDefault(c => c.cedula == cedula);
            if (pacienteAEliminar != null){
                _contexto.Pacientes.Remove(pacienteAEliminar);
                _contexto.SaveChanges();
            }
            
        }


        public Paciente obtenerPaciente(int cedula)
        {
            Paciente pacienteEncontrado = _contexto.Pacientes.Include("medico").Include("enfermera").Include("familiar").FirstOrDefault(c => c.cedula == cedula);
            return pacienteEncontrado;
        }

        public IEnumerable<Paciente> obtenerPacientes()
        {
            return _contexto.Pacientes.Include("medico").Include("enfermera").Include("familiar");
        }
    }
}