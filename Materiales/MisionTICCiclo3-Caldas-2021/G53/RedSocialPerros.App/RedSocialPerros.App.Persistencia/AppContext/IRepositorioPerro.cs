using System.Collections.Generic;
using RedSocialPerros.App.Dominio;

namespace RedSocialPerros.App.Persistencia
{
    public interface IRepositorioPerro{
    
      //Consultar todos los perros
      IEnumerable<Perro> obtenerPerros();

      //Añadir perro
      Perro agregarPerro(Perro perro);
         
      //Actualizar perro
      Perro actualizarPerro(Perro perro);
      
      //Borrar
      void BorrarPerro(int perroID);
      
      //Consultar id
      Perro obtenerPerro(int perroID);


   }
}