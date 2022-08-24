using System;

namespace TicketMetro.App.Dominio{
    public class Ticket{

        public int ID { get; set; }
        public Persona objPersona { get; set; }
        public Estacion estacionInicial { get; set; }
        public Estacion estacionFinal { get; set; }

        public int precio { get; set; }

        public DateTime fecha { get; set; }
    }

}