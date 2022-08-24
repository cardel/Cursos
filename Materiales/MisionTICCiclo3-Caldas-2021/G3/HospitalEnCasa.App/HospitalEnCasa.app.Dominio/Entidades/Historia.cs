using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
        public class Historia{
        [Key]
        public int Id{ get; set; }
        public List<Anotacion> anotaciones{ get; set; }        
        public string descripcion { get; set; }
    }
}