using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HospitalEnCasa.App.FrontEnd
{
    public class DetailHistoriaModel : PageModel
    {
        public void OnGet(int cedula, string tipo)
        {
            Console.WriteLine(cedula+" "+tipo);
        }
    }
}
