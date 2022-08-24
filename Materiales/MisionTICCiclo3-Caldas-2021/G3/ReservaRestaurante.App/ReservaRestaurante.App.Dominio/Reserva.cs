using System;

namespace ReservaRestaurante.App.Dominio{
    public class Reserva{
        public int Id { get; set; }
        public Cliente cliente {get; set; }
        public Mesero mesero {get; set; }
        public Mesa mesa {get; set; }
        public DateTime fecha{get; set; }
    }
}