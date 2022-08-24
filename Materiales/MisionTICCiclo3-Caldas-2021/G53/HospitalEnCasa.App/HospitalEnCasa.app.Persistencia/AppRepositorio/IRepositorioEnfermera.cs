using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{

    public interface IRepositorioEnfermera{
        IEnumerable<Enfermera> getEnfermeras();
        Enfermera getEnfermera(int cedula);
        Enfermera editEnfermera(Enfermera enfermera);
        void removeEnfermera(int cedula);

        Enfermera addEnfermera(Enfermera enfermera);
    }
}