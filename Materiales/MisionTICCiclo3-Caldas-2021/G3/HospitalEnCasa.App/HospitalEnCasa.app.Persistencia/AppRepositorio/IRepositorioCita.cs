using System;
using System.Collections.Generic;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia{
    public interface IRepositorioCita{
        IEnumerable<Cita> getAllCitas();
        Cita addCita(Cita cita);
        IEnumerable<Cita> getCitasPerDay(DateTime dia);
        int ReportCitas(DateTime dia);
    }
}