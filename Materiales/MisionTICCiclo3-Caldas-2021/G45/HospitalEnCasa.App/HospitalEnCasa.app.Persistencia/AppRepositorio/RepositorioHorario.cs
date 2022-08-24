using System.Collections.Generic;
using System.Linq;
using HospitalEnCasa.app.Dominio;

namespace HospitalEnCasa.app.Persistencia
{
    public class RepositorioHorario : IRepositorioHorario
    {
        private readonly Contexto _contexto;

        public RepositorioHorario(Contexto contexto)
        {
            this._contexto = contexto;
        }
        public Horario AddHorario(Horario Horario, int IdMedico)
        {
            Medico Medico = _contexto.Medicos.FirstOrDefault(m => m.Id == IdMedico);

            Medico Verificacion = _contexto.Medicos.FirstOrDefault(m => m.Id == IdMedico && m.Horarios.Any(h => h.Dia == Horario.Dia));

            if (Verificacion == null)
            {
                List<Horario> horarios = Medico.Horarios;
                horarios.Add(Horario);
                Medico.Horarios = horarios;
                _contexto.SaveChanges();
                return Horario;
            }
            else
            {
                return null;
            }


        }
    }
}