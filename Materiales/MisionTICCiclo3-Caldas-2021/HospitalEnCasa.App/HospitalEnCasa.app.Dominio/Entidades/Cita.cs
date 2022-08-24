using System.ComponentModel.DataAnnotations;
using System;

namespace HospitalEnCasa.app.Dominio
{
    public class Cita
    {
        [Key]
        public int Id { get; set; }
        public Paciente Paciente { get; set; }
        public Medico Medico { get; set; }
        [Required,DataType(DataType.Date),Range(typeof(DateTime), "1/1/2021", "31/12/2025",
        ErrorMessage = "El valor {0} debe estar {1} y {2}")]
        public DateTime Dia { get; set; }
        [Required,DataType(DataType.Time)]
        public DateTime Hora { get; set; }
        public Sala Sala { get; set; }
        public string Descripcion { get; set; }
    }
}