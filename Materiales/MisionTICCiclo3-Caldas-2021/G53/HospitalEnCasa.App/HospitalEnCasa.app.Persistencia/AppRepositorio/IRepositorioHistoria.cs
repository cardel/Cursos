using System;
using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioHistoria{
        IEnumerable<Historia> getAllHistoria();
        Historia addHistoria(Historia historia);
        Historia editHistoria(Historia historia);
        Historia getHistoria(int Id);

        Historia getHistoriaByPaciente(Paciente paciente);
        Historia getHistoriaByMedico(Medico medico);
        Historia getHistoriaByMedicoFecha(Medico medico, DateTime inicial, DateTime final);
        void removeHistoria(int Id);
    }
}