using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class Familiar:Persona{

        public string direccion { get; set; }

        public int latitud { get; set; }
        public int longitud { get; set; }
    }
}