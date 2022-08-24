using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Enfermera:Persona{
        [Required(ErrorMessage = "El hospital es requerid0."), StringLength(50)]
        public string hospital{get; set;}
        [Required(ErrorMessage = "La información laboral es requerida."), StringLength(50)]
        public string informacion_laboral { get; set; }
    }
}