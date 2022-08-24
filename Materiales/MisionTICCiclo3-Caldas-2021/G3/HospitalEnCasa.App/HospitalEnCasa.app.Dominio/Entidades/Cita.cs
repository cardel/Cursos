using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Cita{
        [Key]
        public int id { get; set; }
        public Medico medico {get; set; }
        public Paciente paciente {get; set; }
        [Required(ErrorMessage = "El día es obligatorio."),DataType(DataType.Date),Range(typeof(DateTime), "1/1/2021", "31/12/2025",
        ErrorMessage = "El valor {0} debe estar {1} y {2}")]

        public DateTime dia { get; set; }
        [Required(ErrorMessage = "La hora es obligatoria."),DataType(DataType.Time)]
        public DateTime hora { get; set; }
        [Required]
        public string descripcion { get; set;}
        [Required]
        public Sala sala { get; set; }
    }
}