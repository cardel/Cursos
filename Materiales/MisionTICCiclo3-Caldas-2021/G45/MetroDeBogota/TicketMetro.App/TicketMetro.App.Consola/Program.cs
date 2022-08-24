using System;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using TicketMetro.App.Dominio;
using TicketMetro.App.Persistencia;

namespace TicketMetro.App.Consola
{
    class Program
    {
        static void Main(string[] args)
        {
            
            while(true){
                var objContexto = new Contexto();
                Console.WriteLine("Ingrese la opción");
                Console.WriteLine("1. Ingresar estación");
                Console.WriteLine("2. Ingresar persona");
                Console.WriteLine("3. Ingresar ticket");
                Console.WriteLine("4. Consultar personas");
                Console.WriteLine("5. Consultar estaciones");
                Console.WriteLine("6. Consultar tickets");
                Console.WriteLine("7. Salir");
                int opcion = Convert.ToInt32(Console.ReadLine());

                switch(opcion){

                    case 1:
                        Console.WriteLine("Ingrese el nombre de la estación");
                        string nombreEstacion = Console.ReadLine();
                        Console.WriteLine("Ingrese la latitud");
                        double latitudEstacion = Convert.ToDouble(Console.ReadLine());
                        Console.WriteLine("Ingrese la longitud");
                        double longitudEstacion = Convert.ToDouble(Console.ReadLine());

                        Estacion objEstacion = new Estacion(){
                            nombre = nombreEstacion,
                            latitud = latitudEstacion,
                            longitud = longitudEstacion
                        };

                        

                        objContexto.Add(objEstacion);
                        objContexto.SaveChanges();


                        break;
                    case 2:
                        Console.WriteLine("Ingrese la cedula");
                        int cedula = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Ingrese el nombre de la persona");
                        string nombrePersona = Console.ReadLine();
                        Console.WriteLine("Ingrese el apellido");
                        string apellidoPersona = Console.ReadLine();
                        Console.WriteLine("Ingrese la dirección");
                        string direccionPersona = Console.ReadLine();

                        Persona objPersona = new Persona(){
                            nombre = nombrePersona,
                            apellido = apellidoPersona,
                            direccion = direccionPersona,
                            cedula = cedula
                        };
                        try{
                            objContexto.Add(objPersona);
                            objContexto.SaveChanges();
                        }
                        catch{
                            Console.WriteLine("La cedula ya está registrada en el sistema.");
                        }


                        break;
                    case 3:

                            try{
                                Console.WriteLine("Ingrese la cedula de la persona");
                                cedula = Convert.ToInt32(Console.ReadLine());
                                var persona = objContexto.Personas.Where(p => p.cedula == cedula).Single();
                            
                                Console.WriteLine("Ingrese el nombre de la estación inicial");
                                string nombre_estacion_inicial = Console.ReadLine(); 

                                var estacion_inicial = objContexto.Estaciones.Where(e => e.nombre == nombre_estacion_inicial).Single();
                                
                                Console.WriteLine("Ingrese el nombre de la estación final");
                                string nombre_estacion_final = Console.ReadLine(); 

                                var estacion_final = objContexto.Estaciones.Where(e => e.nombre == nombre_estacion_final).Single();
                                
                                Console.WriteLine("Ingrese el precio (int) del ticket");
                                int precio_total = Convert.ToInt32(Console.ReadLine());

                                Console.WriteLine("Ingrese el año del ticket");
                                int anio = Convert.ToInt32(Console.ReadLine());

                                Console.WriteLine("Ingrese el mes del ticket");
                                int mes = Convert.ToInt32(Console.ReadLine());

                                Console.WriteLine("Ingrese el día del ticket");
                                int dia = Convert.ToInt32(Console.ReadLine());

                                DateTime fecha_ticket = new DateTime(anio,mes,dia);

                                Ticket objTicket = new Ticket(){
                                    objPersona = persona,
                                    estacionInicial = estacion_inicial,
                                    estacionFinal = estacion_final,
                                    precio = precio_total,
                                    fecha = fecha_ticket
                                };

                                objContexto.Add(objTicket);
                                objContexto.SaveChanges();
                            }
                            catch(Exception e){
                                System.Console.WriteLine("El dato no existe "+e.ToString());
                            }
       
                        break;
                    case 4:
                        var personas = objContexto.Personas;
                        foreach (var persona in personas){
                            Console.WriteLine("Nombre :"+persona.nombre+" Apellido "+persona.apellido+" Dirección "+persona.direccion);
                        }
                        
                        break;
                    case 5:
                        var estaciones = objContexto.Estaciones;
                        foreach (var estacion in estaciones){
                            Console.WriteLine("Nombre :"+estacion.nombre+" Latitud "+estacion.latitud+" Longitud "+estacion.longitud);
                        }
                        break;
                    case 6:
                        var tickets = objContexto.Tickets.Include("objPersona").Include("estacionInicial").Include("estacionFinal");
                            
                        foreach(var ticket in tickets){
                            Console.WriteLine(ticket.ID+" Estacion Inicial "+ticket.estacionInicial.nombre+" Estacion final "+ticket.estacionFinal.nombre+" Persona "+ticket.objPersona.nombre+" Fecha "+ticket.fecha);
                        }
                        break;
                    case 7:
                        break;
                    default:
                        Console.WriteLine("Opción no válida");
                        break;
                }

                if(opcion == 7){
                    break;
                }
            }

            
        }
    }
}
