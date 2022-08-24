using System;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;


namespace HospitalEnCasa.App.Consola
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Escriba el nombre");
            string name = Console.ReadLine();  
            Console.WriteLine("Escriba la cédula");
            int cedula = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Escriba la edad");
            int year = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Indique el genero");
            string genero = Console.ReadLine();
            Console.WriteLine("Indique el hospital");
            string hospital = Console.ReadLine();
            Console.WriteLine("Indique la tarjeta_profesional");
            string tarjeta_profesional = Console.ReadLine();
            
            Genero generomedico;

            if(genero=="masculino"){
                generomedico = Genero.masculino;
            }
            else{
                generomedico = Genero.femenino;
            }

            Medico objMedico = new Medico(){
                cedula = cedula,
                nombre = name,
                genero = generomedico,
                edad = year,
                nombre_hospital = hospital,
                tarjeta_profesional = tarjeta_profesional,

            };

            IRepositorioMedico repoMedico = new RepositorioMedico(new Contexto());
            repoMedico.addMedico(objMedico);


        }


    }
}
