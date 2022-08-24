using HospitalEnCasa.app.Dominio;
using System.Linq;
using System.Collections.Generic;

namespace HospitalEnCasa.app.Persistencia{
    public class RepositorioHorario:IRepositorioHorario{
        private readonly Contexto _contexto;

        public RepositorioHorario(Contexto contexto){
            this._contexto = contexto;
        }
        public void AddHorario(Horario Horario, int IdMedico){
            Medico Medico = _contexto.Medicos.FirstOrDefault(m=>m.Id == IdMedico);

            List<Horario> horarios = Medico.Horarios;
            horarios.Add(Horario);
            Medico.Horarios = horarios;

            _contexto.SaveChanges();

            
        }
    }
}