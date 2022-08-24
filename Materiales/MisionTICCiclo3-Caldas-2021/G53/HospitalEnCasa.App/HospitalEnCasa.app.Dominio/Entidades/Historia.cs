using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Historia{
        public int Id { get; set; }
        [Required]
        public string serial { get; set; }
        public List<Anotacion> anotaciones {get; set; }
        [Required, StringLength(100, MinimumLength = 12, ErrorMessage = "La descripción debe tener al menos 12 caracteres y máximo 100")]        
        public String descripcion { get; set; }
        
    }
}