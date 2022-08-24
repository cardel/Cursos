using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{

    public interface IRepositorioAnotacion{
        IEnumerable<Anotacion> getAllAnotacion();
        Anotacion addAnotacion(Anotacion anotacion);
        Anotacion editAnotacion(Anotacion anotacion);
        Anotacion getAnotacion(int Id);
        void removeAnotacion(int Id);
    }
}