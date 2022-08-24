using System;

namespace ReservaRestaurante.App.Dominio{

    public class Cliente{
        public int Id { get; set; }
        public int cedula { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public int edad{ get; set;}
    }
}