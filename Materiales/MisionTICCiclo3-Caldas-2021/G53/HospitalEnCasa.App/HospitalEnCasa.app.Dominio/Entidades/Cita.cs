using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Cita{
        [Key]
        public int Id { get; set; }
        public Paciente Paciente { get; set; }
        public Medico Medico { get; set; }
        
        [Required,DataType(DataType.Date)]
        public DateTime Dia { get; set; }
        [Required,DataType(DataType.Time)]
        public DateTime Hora { get; set; }
        public Sala Sala { get; set; }
    }
}