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

        IEnumerable<Historia> getHistoriaByPaciente(Paciente paciente);
        IEnumerable<Historia> getHistoriaByMedico(Medico medico);

        IEnumerable<Historia> getHistoriaByEnfermera(Enfermera enfermera);

        Historia getHistoriaByOnePaciente(Paciente Paciente);
    }
}