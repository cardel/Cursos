using System.ComponentModel.DataAnnotations;

namespace HospitalEnCasa.app.Dominio{
    public class SignoVital{
        public int Id { get; set; }
        [Range(0,200,ErrorMessage="El pulso debe estar entre 0 y 200")]
        public int pulso_cardiaco{ get; set;}
        [Range(0,200,ErrorMessage="La presión debe estar entre 0 y 200")]

        public int presion { get; set;}
        [Range(0,200,ErrorMessage="El nivel debe estar entre 0 y 200")]

        public double nivel_azucar { get; set; }
    }
}