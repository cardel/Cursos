using System;
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
            this._contexto = contexto;
            this.security = new Security();
        }
        public Paciente addPaciente(Paciente paciente)
        {
            String password = paciente.password;
            password = security.GetMD5Hash(password);
            paciente.password = password;
            Paciente pacienteNuevo = _contexto.Add(paciente).Entity;
            _contexto.SaveChanges();
            return pacienteNuevo;
        }

        public Paciente editPaciente(Paciente paciente)
        {
            Paciente pacienteAEditar = _contexto.Pacientes.FirstOrDefault(p => p.Id == paciente.Id);
            String password = paciente.password;
            password = security.GetMD5Hash(password);
            paciente.password = password;

            if(pacienteAEditar != null){
                pacienteAEditar.cedula = paciente.cedula;
                pacienteAEditar.nombre = paciente.nombre;
                pacienteAEditar.edad = paciente.edad;
                pacienteAEditar.genero = paciente.genero;
                pacienteAEditar.direccion=paciente.direccion;
                pacienteAEditar.latitud = paciente.latitud;
                pacienteAEditar.longitud = paciente.longitud;
                pacienteAEditar.familiar = paciente.familiar;
                pacienteAEditar.enfermera = paciente.enfermera;
                pacienteAEditar.medico = paciente.medico;
                pacienteAEditar.username = paciente.username;
                pacienteAEditar.email = paciente.email;
                pacienteAEditar.password = paciente.password;
                _contexto.SaveChanges();
            }
            return pacienteAEditar;
        }

        public IEnumerable<Paciente> getAllPacientes()
        {
            return _contexto.Pacientes.Include("familiar").Include("medico").Include("enfermera");
        }

        public Paciente getPaciente(int cedula)
        {
            return _contexto.Pacientes.Include("familiar").Include("medico").Include("enfermera").FirstOrDefault(p => p.cedula == cedula);
        }

        public void RemovePaciente(int cedula)
        {
            Paciente pacienteAEliminar = _contexto.Pacientes.FirstOrDefault(p => p.cedula == cedula);
            if(pacienteAEliminar != null){
                _contexto.Pacientes.Remove(pacienteAEliminar);
                _contexto.SaveChanges();
            }
        }
    }
}