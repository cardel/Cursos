using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioPaciente{
        IEnumerable<Paciente> obtenerPacientes();
        Paciente obtenerPaciente(int cedula);
        Paciente editarPaciente(Paciente paciente);
        void eliminarPaciente(int cedula);
        Paciente agregarPaciente(Paciente paciente);

    }
}