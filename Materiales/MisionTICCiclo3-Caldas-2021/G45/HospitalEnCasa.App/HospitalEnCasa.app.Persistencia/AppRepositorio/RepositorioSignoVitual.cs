using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioSignoVital : IRepositorioSignoVital
    {
        private readonly Contexto _contexto;

        public RepositorioSignoVital(Contexto context){
            _contexto = context;
        }
        public SignoVital AddSignoVital(SignoVital signo)
        {
            SignoVital signoNuevo = _contexto.Add(signo).Entity;
            _contexto.SaveChanges();
            return signoNuevo;
        }

        public SignoVital EditSignoVital(SignoVital signo)
        {
            SignoVital signoEncontrado = _contexto.SignoVitales.FirstOrDefault(s => s.Id == signo.Id);
            if(signoEncontrado != null){
                signoEncontrado.nivel_azucar = signo.nivel_azucar;
                signoEncontrado.presion = signo.presion;
                signoEncontrado.pulso_cardiaco = signo.pulso_cardiaco;
                _contexto.SaveChanges();
            }
            return signoEncontrado;
        }

        public IEnumerable<SignoVital> getAllSignosVitales()
        {
            return _contexto.SignoVitales;
        }

        public SignoVital GetSignoVital(int Id)
        {
            return _contexto.SignoVitales.FirstOrDefault(s => s.Id == Id);
        }

        public void RemoveSignoVital(int Id)
        {
            SignoVital signoEncontrado = _contexto.SignoVitales.FirstOrDefault(s => s.Id == Id);
            if(signoEncontrado != null){
                _contexto.SignoVitales.Remove(signoEncontrado);
                _contexto.SaveChanges();
            }
        }
    }
}