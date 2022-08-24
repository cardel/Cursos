using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Familiar_Designado:Persona{
        [Required(ErrorMessage = "La dirección es requerida.")]
        public string direccion { get; set; }
        [Required(ErrorMessage = "La latitud es requerida.")]
        public int latitud {get; set;}
        [Required(ErrorMessage = "La longitud es requerida.")]
        public int longitud {get; set;}
    }
}