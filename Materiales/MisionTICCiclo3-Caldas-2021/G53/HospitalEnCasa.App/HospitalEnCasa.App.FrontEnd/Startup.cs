using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Persistencia;
using HospitalEnCasa.App.FrontEnd.Areas.Identity.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace HospitalEnCasa.App.FrontEnd
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddRazorPages(
                options =>
                {
                    options.Conventions.AuthorizeFolder("/GestorAnotaciones");
                    options.Conventions.AuthorizeFolder("/GestorCitas");
                    options.Conventions.AuthorizeFolder("/GestorEnfermeras");
                    options.Conventions.AuthorizeFolder("/GestorHistorias");
                    options.Conventions.AuthorizeFolder("/GestorMedicos");
                    options.Conventions.AuthorizeFolder("/GestorPacientes");
                    options.Conventions.AuthorizeFolder("/GestorFamiliares");
                    options.Conventions.AllowAnonymousToPage("/Privacy");
                    options.Conventions.AuthorizePage("/Index");
                }
            );

            Contexto _context = new Contexto();
            services.AddSingleton<IRepositorioMedico>(new RepositorioMedico(_context));
            services.AddSingleton<IRepositorioEnfermera>(new RepositorioEnfermera(_context));
            services.AddSingleton<IRepositorioFamiliar>(new RepositorioFamiliar(_context));
            services.AddSingleton<IRepositorioPaciente>(new RepositorioPaciente(_context));
            services.AddSingleton<IRepositorioAnotacion>(new RepositorioAnotacion(_context));
            services.AddSingleton<IRepositorioHistoria>(new RepositorioHistoria(_context));
            services.AddSingleton<IRepositorioCita>(new RepositorioCita(_context));
            services.AddControllersWithViews();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Conference}/{action=Index}/{id?}"
                );
                endpoints.MapRazorPages();
            });
        }
    }
}
