using System;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;


namespace HospitalEnCasa.App.Consola
{
    class Program
    {
        static void Main(string[] args)
        {
            IRepositorioMedico repositorioMedico = new RepositorioMedico(new Contexto());
        }


    }
}
