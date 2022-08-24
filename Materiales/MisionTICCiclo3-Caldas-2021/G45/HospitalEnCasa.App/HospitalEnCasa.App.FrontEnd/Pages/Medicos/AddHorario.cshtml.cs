using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using HospitalEnCasa.app.Dominio;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace HospitalEnCasa.App.FrontEnd.Pages
{
    public class AddHorarioModel : PageModel
    {
        private readonly IRepositorioHorario repositorioHorario;
        private readonly IRepositorioMedico repositorioMedico;

        public SelectList Medicos { get; set; }
        public Horario Horario {get; set; }
        public int CedulaMedico { get; set; }

        public AddHorarioModel(IRepositorioMedico repositorioMedico, IRepositorioHorario repositorioHorario){
            this.repositorioMedico = repositorioMedico;
            this.repositorioHorario = repositorioHorario;
            Medicos = new SelectList(repositorioMedico.getMedicos(),nameof(Medico.cedula),nameof(Medico.nombre));

        }
        public void OnGet()
        {
        }

        public IActionResult OnPost(Horario Horario, int CedulaMedico){
            Medico medico = repositorioMedico.obtenerMedico(CedulaMedico);
            if(ModelState.IsValid){
                Horario HorarioNuevo = repositorioHorario.AddHorario(Horario, medico.Id);
                if(HorarioNuevo != null){
                    return RedirectToPage("./ListHorario");
                }
                else{
                    ModelState.AddModelError(string.Empty,"El médico tiene un horario el mismo día");
                    return Page();
                }
            }
            else{
                return Page();
            }
        }
    }
}
