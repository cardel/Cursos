using System.ComponentModel.DataAnnotations;
using System;
using System.Collections.Generic;

namespace HospitalEnCasa.app.Dominio{ 
    public class Medico:Persona{
        public string nombre_hospital { get; set; } 
        [Required(ErrorMessage="La tarjeta profesional es requerida")]
        public string tarjeta_profesional { get; set;}
        public List<Horario> Horarios { get; set;}
    }
}