using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioHorario{
        Horario AddHorario(Horario Horario, int IdMedico);
    }
}