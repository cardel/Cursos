using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio
{
    public class Anotacion
    {
        [Key]
        public int Id { get; set; }
        public Paciente paciente { get; set; }
        public Medico medico {get; set; }
        public Enfermera enfermera{get; set; }
        public string descripcion {get; set; }
        public SignoVital signoVital {get; set; }

        [Required(ErrorMessage = "La fecha es obligatoria."),DataType(DataType.DateTime),Range(typeof(DateTime), "1/1/2021", "31/12/2025",
        ErrorMessage = "El valor {0} debe estar {1} y {2}")]
        public DateTime fecha { get; set; }
    }
}