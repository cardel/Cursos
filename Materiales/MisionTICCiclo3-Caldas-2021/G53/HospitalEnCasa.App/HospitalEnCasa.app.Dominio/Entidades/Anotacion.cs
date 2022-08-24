using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Anotacion{
        [Required]
        public int Id { get; set; }
        public Paciente paciente { get; set; }
        public Medico medico { get; set; }
        public Enfermera enfermera { get; set; }
        [Required]
        public string descripcion { get; set; }
        [Required, Range(typeof(DateTime), "1/1/2021", "1/1/2050",
        ErrorMessage = "La fecha {0} debe estar entre {1} y {2}")]
        public DateTime fecha { get; set; }
    }
}