using System;
using RedSocialPerros.App.Dominio;
using RedSocialPerros.App.Persistencia;

namespace RedSocialPerros.App.Consola
{
    class Program
    {
        static void Main(string[] args)
        {
            int opcion = 0;
            while(opcion!=-1){
                Console.WriteLine("Seleccione una opción");
                Console.WriteLine("1. Ingresar un perro");
                Console.WriteLine("2. Ingresar una persona");
                Console.WriteLine("3. Ingresar una amistad");
                Console.WriteLine("4. Consultar perros");
                Console.WriteLine("5. Consultar personas");
                Console.WriteLine("Escriba -1 para salir");
                opcion = Convert.ToInt32(Console.ReadLine());

                IRepositorioPerro objRepositorioperro = new RepositorioPerro(new Contexto());

                switch (opcion){
                    case 1:
                        Console.WriteLine("Ingrese el número de registro del perro");
                        int registro = Convert.ToInt32(Console.ReadLine());

                        Console.WriteLine("Ingrese el nombre del perro");
                        string nombre_perro = Console.ReadLine();

                        Console.WriteLine("Ingrese la edad del perro");
                        int edad = Convert.ToInt32(Console.ReadLine());

                        Console.WriteLine("Ingrese la raza del perro");
                        string raza = Console.ReadLine();

                        Perro objPerroA = new Perro(){
                            numero_registro = registro,
                            nombre = nombre_perro,
                            edad = edad,
                            raza = raza
                        };  
                        var respuesta = objRepositorioperro.agregarPerro(objPerroA);        
                        if(respuesta==null){
                            Console.WriteLine("Ha intentado agregar un perro con el mismo número de registro");
                        }
                        break;
                    case 2:
                        /*Console.WriteLine("Ingrese el número de cedula de la persona");
                        int cedula = Convert.ToInt32(Console.ReadLine());

                        Console.WriteLine("Ingrese el nombre  de la persona");
                        string nombre_persona = Console.ReadLine();

                        Console.WriteLine("Ingrese la edad  de la persona");
                        edad = Convert.ToInt32(Console.ReadLine());

                        try{
                            Console.WriteLine("Ingrese el número de registro del perro de esta persona");
                            int registro_perro = Convert.ToInt32(Console.ReadLine());
                            Perro objPerro = objContexto.Perros.Where(p => p.numero_registro == registro_perro).Single();

                            Persona objPersonaA = new Persona(){
                                nombre =nombre_persona,
                                cedula = cedula,
                                edad = edad,
                                perro = objPerro
                            };     
                        }
                        catch{
                            Console.WriteLine("El perro no existe en la base de datos");
                        }
                        */
                        break;
                    case 3:
                        try{ 
                            /*Console.WriteLine("Ingrese el número de registro del perro número 1");
                            int registro_perroA = Convert.ToInt32(Console.ReadLine());
                            objPerroA = objContexto.Perros.Where(p => p.numero_registro == registro_perroA).Single();

                            Console.WriteLine("Ingrese el número de registro del perro número 1");
                            int registro_perroB = Convert.ToInt32(Console.ReadLine());
                            Perro objPerroB = objContexto.Perros.Where(p => p.numero_registro == registro_perroB).Single();

                            if(registro_perroB == registro_perroA){
                                Console.WriteLine("Los números de registro no pueden ser iguales");
                            }
                            else{
                                Console.WriteLine("Indique el año de inicio de la amistad");
                                int anio = Convert.ToInt32(Console.ReadLine());

                                Console.WriteLine("Indique el mes de inicio de la amistad");
                                int mes = Convert.ToInt32(Console.ReadLine());

                                Console.WriteLine("Indique el día de inicio de la amistad");
                                int dia = Convert.ToInt32(Console.ReadLine());

                                DateTime fecha = new DateTime(anio,mes,dia);

                                Amistad objAmistad = new Amistad(){
                                    perroA = objPerroA,
                                    perroB = objPerroB,
                                    fecha_amistad = fecha
                                };
                                objContexto.Add(objAmistad);
                                
                            }*/
                        }
                        catch{
                            Console.WriteLine("El perro no existe en la base de datos");
                        }
                        break;
                    case 4:
                        /*var listaPerros = objContexto.Perros;
                        foreach (var perro in listaPerros){
                            Console.WriteLine("Nombre "+perro.nombre+" Número registro "+perro.numero_registro+" Edad "+perro.edad);
                        }*/
                        break;
                    case 5:
                        /*var listaPersonas = objContexto.Personas.Include("perro");

                        foreach(var persona in listaPersonas){
                            Console.WriteLine("Nombre "+persona.nombre+" Edad "+persona.edad+" Cedula "+persona.cedula+" Perro "+persona.perro.nombre+" -- "+persona.perro.numero_registro);
                        }*/
                        break;
                    default:
                        break;
                }
                try{
                    //objContexto.SaveChanges();
                }
                catch{
                    Console.WriteLine("El registro ya está en la base de datos");
                }
            }
        }
    }
}
