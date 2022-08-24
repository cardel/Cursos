using System;
namespace RedSocialPerros.App.Dominio{
    public class Persona{
      public int Id  { get; set; }
      public int cedula {get; set; }
      public string nombre { get; set; }
      public double edad {get; set; }
      public Perro perro { get; set; }

    }
}

