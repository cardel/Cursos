using System;
using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Anotacion{
        public int Id { get; set; }
        public string descripcion { get; set; }
        public Paciente paciente{get; set; }
        public Medico medico {get; set; }
        public Enfermera enfermera {get; set; }
        public SignoVital signosVital{get; set; }
        [Required,DataType(DataType.DateTime),Range(typeof(DateTime),"01/06/2021","31/12/2023",ErrorMessage="La fecha {0} estar entre {1} y {2}")]
        public DateTime fecha { get; set; }
    }
}
