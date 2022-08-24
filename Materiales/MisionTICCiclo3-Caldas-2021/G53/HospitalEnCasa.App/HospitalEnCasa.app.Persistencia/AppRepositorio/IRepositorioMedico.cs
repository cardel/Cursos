using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia
{
    public interface IRepositorioMedico
    {
         IEnumerable<Medico> getAllMedicos();
         Medico getMedico(int cedula);
         Medico editMedico(Medico medico);
         void removeMedico(int cedula);
         Medico addMedico(Medico medico);

    }
}