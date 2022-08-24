using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioFamiliar{
        IEnumerable<Familiar> getAllFamiliares();
        Familiar addFamiliar(Familiar familiar);
        Familiar editFamiliar(Familiar familiar);
        Familiar getFamiliar(int cedula);
        void removeFamiliar(int cedula);
    }
}