using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioHorario{
        void AddHorario(Horario Horario, int IdMedico);
    }
}