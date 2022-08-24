using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioSignoVital{
        public IEnumerable<SignoVital> getAllSignosVitales();
        public SignoVital GetSignoVital(int Id);
        public SignoVital AddSignoVital(SignoVital signo);
        public void RemoveSignoVital(int Id);
        public SignoVital EditSignoVital(SignoVital signo);
    }
}