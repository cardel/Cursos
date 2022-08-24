using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio
{
    public class Persona{
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage="La cedula es requerida"),Range(0,int.MaxValue,ErrorMessage="La cedula debe ser mayor que 0")]
        public int cedula { get; set; }
        public string nombre{ get;set;}
        [Required(ErrorMessage="El nombre es requerido"),Range(0,150,ErrorMessage="La edad debe estar entre 0 y 150")]
        public int edad{get; set;}
        public Genero genero{ get; set; }
        [Required(ErrorMessage = "El email es requerido."),EmailAddress(ErrorMessage = "El dato de ser un email")]
        public string email{ get; set;}
        [Required(ErrorMessage = "El nombre de usuario es requerido."),RegularExpression(@"^\S*$", ErrorMessage = "No se permiten espacios")]
        public string username { get; set; }
        [Required(ErrorMessage = "La contraseña es requerida."),DataType(DataType.Password),StringLength(100,MinimumLength=6,ErrorMessage="La contraseña debe tener entre 6 y 100 carácteres")]
        public string password { get; set; }
    }
}