using HospitalEnCasa.app.Dominio;
using System.Collections.Generic;
namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioCita{
        IEnumerable<Cita> GetAllCitas();
        Cita GetCita(int Id);
        Cita AddCita(Cita cita);
    }
}