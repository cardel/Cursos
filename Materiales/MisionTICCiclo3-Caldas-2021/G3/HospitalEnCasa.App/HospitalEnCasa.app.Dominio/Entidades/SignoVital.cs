using System;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.Contracts;

namespace HospitalEnCasa.app.Dominio{ 
    public class SignoVital{
        [Key]
        public int Id { get; set; }
        [Required,Range(0.0,200.0)]
        public double pulso_cardiaco { get; set; }
        [Required,Range(0.0,200.0)]
        public double presion { get; set; }
        [Required,Range(0.0,200.0)]
        public double nivel_azucar { get; set; }
    }
}