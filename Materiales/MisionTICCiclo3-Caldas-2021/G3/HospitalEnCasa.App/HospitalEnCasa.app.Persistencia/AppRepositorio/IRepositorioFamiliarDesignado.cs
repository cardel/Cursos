using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioFamiliarDesignado{
        IEnumerable<Familiar_Designado> getAllFamiliarDesignados();
        Familiar_Designado addFamiliarDesignado(Familiar_Designado familiar);
        Familiar_Designado editFamiliarDesignado(Familiar_Designado familiar);
        Familiar_Designado getFamiliarDesignado(int cedula);
        void RemoveFamiliarDesignado(int cedula);
    }
}