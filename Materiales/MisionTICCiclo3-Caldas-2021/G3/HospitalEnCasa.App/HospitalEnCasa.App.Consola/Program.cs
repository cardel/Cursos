using Internal;
using System;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using System.Linq;

namespace HospitalEnCasa.App.Consola
{
    class Program
    {
        static void Main(string[] args)
        {
            Contexto _contexto = new Contexto();
            int opcion = 0;
            Console.WriteLine("Ingrese 1 para agregar anotacion");
            opcion = Convert.ToInt32(Console.ReadLine());
            if(opcion ==1){
                Anotacion anotacion1 = new Anotacion(){

                };
            }
            var query = from h in _contexto.historias 
            join a in _contexto.anotaciones on h.anotacion.Id equals a.Id
            select new HistoriaAnotacion{
                        Id = h.Id,
                        fecha = h.fecha,
                        enfermera = a.enfermera,
                        paciente = a.paciente,
                        medico = a.medico,
                        descripcion = a.descripcion,
                        formula_medica = a.formula_medica,
                    };
            var historias = _contexto.historias
                .Join(
                    _contexto.anotaciones,
                    h => h.anotacion.Id,
                    a => a.Id,
                    (h,a) => 
                    new {
                        historiaID = h.Id,
                        fecha = h.fecha,
                        enfermera = a.enfermera,
                        paciente = a.paciente,
                        medico = a.medico,
                        descripcion = a.descripcion,
                        formula_medica = a.formula_medica,
                    }

                );

            foreach (var historia in historias){
                Console.WriteLine(historia);
            }
        }


    }
}
