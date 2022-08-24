using System.Collections.Generic;
using System.Linq;
using RedSocialPerros.App.Dominio;

namespace RedSocialPerros.App.Persistencia
{
    public class RepositorioPerro : IRepositorioPerro
    {
        private readonly Contexto _contexto;

        public RepositorioPerro(Contexto contexto){
            _contexto = contexto;
        }
        public Perro actualizarPerro(Perro perro)
        {
            var perroEncontrado = _contexto.Perros.Where(x => x.Id == perro.Id).FirstOrDefault();
            if(perroEncontrado!=null){
                perroEncontrado.edad = perro.edad;
                perroEncontrado.nombre = perro.nombre;
                perroEncontrado.raza = perro.raza;
                perroEncontrado.numero_registro = perro.numero_registro;
                _contexto.SaveChanges();
            }
            return perroEncontrado;
        }

        public Perro agregarPerro(Perro perro)
        {
            try{
                var perroNuevo = _contexto.Add(perro);
                _contexto.SaveChanges();
                return perroNuevo.Entity;
            }
            catch{
                return null;
            }
        }

        public void BorrarPerro(int perroID)
        {
            var perro = _contexto.Perros.Where(x => x.Id == perroID).FirstOrDefault();
            if(perro == null){
                return;
            }
            else{
                _contexto.Remove(perro);
                _contexto.SaveChanges();
            }  
        }

        public Perro obtenerPerro(int perroID)
        {
            var perro = _contexto.Perros.Where(x => x.Id == perroID).FirstOrDefault();
            return perro;
        }

        public IEnumerable<Perro> obtenerPerros()
        {
            return _contexto.Perros;
        }
    }
}