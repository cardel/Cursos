using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio
{
    public class Persona{

        public int Id { get; set; }
        [Required]
        public int cedula { get; set; }
        [Required]
        public string nombre{ get;set;}
        [Required, Range(0,150,ErrorMessage="La edad debe estar entre 0 y 150")]
        public int edad{get; set;}
        [Required,RegularExpression(@"^\S*$", ErrorMessage = "No se permiten espacios libres")]
        public string username { get; set; }
        [Required, DataType(DataType.Password), StringLength(50, MinimumLength = 6,ErrorMessage = "La contraseña debe tener mínimo 6 y máximo 20 carácteres")]
        public string password { get; set;}
        [DataType(DataType.EmailAddress,ErrorMessage = "El email no es correcto")]
        public string email { get; set;}
        public Genero genero{ get; set; }
    }
}