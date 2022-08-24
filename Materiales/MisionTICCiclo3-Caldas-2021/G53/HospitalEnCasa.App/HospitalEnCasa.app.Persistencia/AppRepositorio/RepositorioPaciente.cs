using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioPaciente : IRepositorioPaciente
    {
        private readonly Contexto _contexto;

        public RepositorioPaciente(Contexto context){
            this._contexto = context;
        }
        public Paciente addPaciente(Paciente paciente)
        {
            Paciente nuevoPaciente = _contexto.Add(paciente).Entity;
            _contexto.SaveChanges();
            return nuevoPaciente;
        }

        public Paciente editPaciente(Paciente paciente)
        {
            Paciente pacienteAEditar = _contexto.Pacientes.FirstOrDefault(f => f.Id == paciente.Id);
            if(pacienteAEditar != null){
                pacienteAEditar.cedula = paciente.cedula;
                pacienteAEditar.nombre = paciente.nombre;
                pacienteAEditar.edad = paciente.edad;
                pacienteAEditar.genero = paciente.genero;
                pacienteAEditar.direccion = paciente.direccion;
                pacienteAEditar.latitud = paciente.latitud;
                pacienteAEditar.longitud = paciente.longitud;
                pacienteAEditar.medico = paciente.medico;
                pacienteAEditar.familiar = paciente.familiar;
                pacienteAEditar.enfermera = paciente.enfermera;
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
            return _contexto.Pacientes.FirstOrDefault(x => x.cedula == cedula);
        }

        public void removePaciente(int cedula)
        {
            Familiar familiarAEliminar = _contexto.Familiares.FirstOrDefault(x => x.cedula == cedula);
            if(familiarAEliminar != null){
                _contexto.Familiares.Remove(familiarAEliminar);
                _contexto.SaveChanges();
            }

        }
    }
}