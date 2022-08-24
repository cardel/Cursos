using System;
using System.Linq;
using ReservaRestaurante.App.Dominio;
using ReservaRestaurante.App.Persistencia;
using Microsoft.EntityFrameworkCore;

namespace ReservaRestaurante.App.Consola
{
    class Program
    {
        static void Main(string[] args)
        {
            Contexto context = new Contexto();
            int opcion = 0;
            while(opcion!=-1){
                Console.WriteLine("Elija una opción");
                Console.WriteLine("1. Ingresar nuevo cliente");
                Console.WriteLine("2. Ingresar nuevo mesero");
                Console.WriteLine("3. Ingresar nueva mesa");
                Console.WriteLine("4. Ingresar nueva reserva");
                Console.WriteLine("5. Consultar clientes");
                Console.WriteLine("6. Consultar meseros");
                Console.WriteLine("7. Consultar mesas");
                Console.WriteLine("8. Consultar reservas");
                Console.WriteLine("Ingrese -1 para salir");
                opcion = Convert.ToInt32(Console.ReadLine());
                switch (opcion){
                    case 1:
                        Console.WriteLine("Ingrese la cédula");
                        int cedula = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Ingrese el nombre");
                        string nombre = Console.ReadLine();
                        Console.WriteLine("Ingrese el apellido");
                        string apellido = Console.ReadLine();
                        Console.WriteLine("Ingrese la edad");
                        int edad = Convert.ToInt32(Console.ReadLine());
                        Cliente clienteA = new Cliente(){
                            nombre = nombre,
                            apellido = apellido,
                            edad = edad,
                            cedula = cedula
                        };
                        context.Add(clienteA);
                        break;
                    case 2:
                        Console.WriteLine("Ingrese la cédula");
                        cedula = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Ingrese el nombre");
                        nombre = Console.ReadLine();
                        Console.WriteLine("Ingrese el apellido");
                        apellido = Console.ReadLine();
                        Console.WriteLine("Ingrese la edad");
                        edad = Convert.ToInt32(Console.ReadLine());
                        Mesero meseroA = new Mesero(){
                            nombre = nombre,
                            apellido = apellido,
                            edad = edad,
                            cedula = cedula
                        };
                        context.Add(meseroA);
                        break;
                    case 3:
                        Console.WriteLine("Ingrese el número");
                        int numero = Convert.ToInt32(Console.ReadLine());

                        Console.WriteLine("Ingrese la ubicación");
                        string ubicacion= Console.ReadLine();

                        Console.WriteLine("Ingrese la categoría");
                        string categoria = Console.ReadLine();

                        Mesa mesaA = new Mesa(){
                            numero = numero,
                            ubicacion = ubicacion,
                            categoria = categoria
                        };
                        context.Add(mesaA);
                        break;
                    case 4:
                        Console.WriteLine("Ingrese la cédula del cliente");
                        cedula = Convert.ToInt32(Console.ReadLine());

                        Cliente clienteC = context.Clientes.Where(t => t.cedula == cedula).FirstOrDefault();
                        
                        while(clienteC == null){ 
                            Console.WriteLine("El cliente no se ha encontrado");                       
                            Console.WriteLine("Ingrese la cédula del cliente");
                            cedula = Convert.ToInt32(Console.ReadLine());

                            clienteC = context.Clientes.Where(t => t.cedula == cedula).FirstOrDefault();                            
                        }

                        Console.WriteLine("Ingrese la cédula del mesero");
                        cedula = Convert.ToInt32(Console.ReadLine());

                        Mesero meseroC = context.Meseros.Where(t => t.cedula == cedula).FirstOrDefault();
                        
                        while(meseroC == null){ 
                            Console.WriteLine("El mesero no se ha encontrado");                       
                            Console.WriteLine("Ingrese la cédula del mesero");
                            cedula = Convert.ToInt32(Console.ReadLine());

                            meseroC = context.Meseros.Where(t => t.cedula == cedula).FirstOrDefault();                            
                        } 

                        Console.WriteLine("Ingrese el número de la mesa");
                        numero = Convert.ToInt32(Console.ReadLine());

                        Mesa mesaC = context.Mesas.Where(t => t.numero == numero).FirstOrDefault();
                        
                        while(mesaC == null){ 
                            Console.WriteLine("La mesa no se ha encontrado");                       
                            Console.WriteLine("Ingrese el número de la mesa");
                            cedula = Convert.ToInt32(Console.ReadLine());

                            mesaC = context.Mesas.Where(t => t.numero == numero).FirstOrDefault();                            
                        } 
                        Console.WriteLine("Indique el año");
                        int anio = Convert.ToInt32(Console.ReadLine());

                        Console.WriteLine("Ingrese el mes (numérico)");
                        int mes = Convert.ToInt32(Console.ReadLine());

                        Console.WriteLine("Ingrese el día");
                        int dia = Convert.ToInt32(Console.ReadLine());

                        Console.WriteLine("Ingrese la hora");
                        int hora = Convert.ToInt32(Console.ReadLine());

                        DateTime fecha_reserva = new DateTime(anio, mes, dia, hora, 0, 0);

                        Reserva reservaA = new Reserva(){
                            cliente = clienteC,
                            mesero = meseroC,
                            mesa = mesaC,
                            fecha = fecha_reserva
                        };
                        context.Add(reservaA);
                        break;
                    case 5:
                        var clientes = context.Clientes;
                        
                        foreach (var cliente in clientes){
                            Console.WriteLine(" Cédula "+cliente.cedula+" Nombre "+cliente.nombre);
                        }
                        break;
                    case 6:
                        var meseros = context.Meseros;
                        foreach (var mesero in meseros)
                        {
                            Console.WriteLine(" Cédula "+mesero.cedula+" Nombre "+mesero.nombre);
                        }
                        break;
                    case 7:
                        var mesas = context.Mesas;
                        foreach(var mesa in mesas){
                            Console.WriteLine(" Número "+mesa.numero+" Ubicación "+mesa.ubicacion+" Categoria "+mesa.categoria);
                           
                        }
                        break;
                    case 8:
                        var reservas = context.Reservas.Include("cliente").Include("mesero").Include("mesa");

                        foreach (var reserva in reservas){
                            Console.WriteLine(" Mesa "+reserva.mesa.numero+" "+reserva.mesa.ubicacion
                            +" Cliente "+reserva.cliente.cedula + " " + reserva.cliente.nombre
                            +" Mesero "+reserva.mesero.nombre  
                            +" Fecha "+reserva.fecha); 
                        }
                        break;
                    case -1:
                        break;
                    default:
                        Console.WriteLine("Opción no válida");
                        break;
                }
                try{
                    context.SaveChanges();
                }
                catch{
                    Console.WriteLine("No se puede tener cedulas de personas o números de mesa repetidos");
                }
            }
           
        }
    }
}
