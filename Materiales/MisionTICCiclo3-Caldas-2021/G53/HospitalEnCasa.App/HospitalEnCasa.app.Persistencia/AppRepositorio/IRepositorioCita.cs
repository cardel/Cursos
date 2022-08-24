using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioCita {
        IEnumerable<Cita> GetAllCitas();
        Cita GetCita(int Id);
        Cita AddCita(Cita Cita);
    }
}