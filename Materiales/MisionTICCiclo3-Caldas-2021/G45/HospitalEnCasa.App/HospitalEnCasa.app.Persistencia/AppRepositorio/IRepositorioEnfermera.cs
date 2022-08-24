using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioEnfermera{
        IEnumerable<Enfermera> getAllEnfermeras();
        Enfermera getEnfermera(int cedula);
        Enfermera editEnfermera(Enfermera enfermera);
        Enfermera addEnfermera(Enfermera enfermera);
        void RemoveEnfermera(int cedula);
    }
}