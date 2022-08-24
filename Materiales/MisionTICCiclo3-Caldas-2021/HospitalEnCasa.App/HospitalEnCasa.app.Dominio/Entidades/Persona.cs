using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio
{
    public class Persona{

        public int Id { get; set; }
        [Required(ErrorMessage ="La cedula es requerida"),Range(1, int.MaxValue, ErrorMessage = "Por favor ingrese una cedula válida")]
        public int cedula { get; set; }
        public string nombre{ get;set;}
        [Range(1,150,ErrorMessage="La edad está entre 1 y 150")]
        public int edad{get; set;}
        public Genero genero{ get; set; }
        [Required(ErrorMessage ="El username es requerido"),RegularExpression(@"^\S*$", ErrorMessage = "No se permiten espacios")]
        public string username{ get; set; }
        
        [Required(ErrorMessage = "La password es requerida"),StringLength(50, MinimumLength=6,ErrorMessage="La password tiene mínimo 6 y máximo 50 caracteres"),DataType(DataType.Password)]
        public string password{ get; set; }
        
        [Required(ErrorMessage="El correo es requerido"), DataType(DataType.EmailAddress,ErrorMessage="Esto debe ser un correo")]
        public string email{ get; set; }
    }
}