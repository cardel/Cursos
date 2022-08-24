using System;
using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioHistoria{
        IEnumerable<Historia> getAllHistorias();
        Historia getHistoria(int Id);
        Historia editHistoria(Historia historia);
        Historia addHistoria(Historia historia);
        void RemoveHistoria(int Id);

        Historia getHistoriaByPaciente(Paciente paciente);
        Historia getHistoriaByMedico(Medico medico);
        Historia getHistoriaByPacienteAndFecha(Paciente paciente,DateTime fecha_inicio,DateTime fecha_final);
    }
}