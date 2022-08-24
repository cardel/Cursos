using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioEnfermera{
        IEnumerable<Enfermera> getAllEnfermeras();
        Enfermera getEnfermera(int cedula);
        Enfermera addEnfermera(Enfermera enfermera);
        Enfermera editEnfermera(Enfermera enfermera);
        void removeEnfermera(int cedula);
    }
}