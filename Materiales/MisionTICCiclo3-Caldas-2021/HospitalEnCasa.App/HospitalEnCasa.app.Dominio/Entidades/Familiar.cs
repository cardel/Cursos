using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{ 

    public class Familiar:Persona{
        [Required(ErrorMessage ="La dirección es requerida")]
        public string direccion { get; set; }
        public int latitud { get; set; }
        public int longitud { get; set; }
    }
}