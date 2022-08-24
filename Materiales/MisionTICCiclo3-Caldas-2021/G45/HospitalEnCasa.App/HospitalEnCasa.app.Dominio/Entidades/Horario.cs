using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace HospitalEnCasa.app.Dominio{
    public class Horario{
        [Key]
        public int Id { get; set; }
        
        [Required]
        public DayOfWeek Dia { get; set; }
        [Required,DataType(DataType.Time)]
        public DateTime Hora_Inicio { get; set; }
        [Required,DataType(DataType.Time)]
        public DateTime Hora_Final{ get; set;}
    }
}