using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Medico:Persona{
        public string tarjeta_profesional { get; set; }
        public string hospital { get; set; }
        [Required(ErrorMessage = "El tiempo de experiencia es obligatorio.")]
        public int tiempo_experiencia { get; set; }
    }
}