using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioAnotacion{
        IEnumerable<Anotacion> getAllAnotacion();
        Anotacion getAnotacion(int Id);
        Anotacion editAnotacion(Anotacion anotacion);
        Anotacion addAnotacion(Anotacion anotacion);
        void removeAnotacion(Anotacion anotacion);
    }
}