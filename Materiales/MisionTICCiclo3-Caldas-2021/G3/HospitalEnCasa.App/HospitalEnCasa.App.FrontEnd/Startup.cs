using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalEnCasa.app.Persistencia;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
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
                options => {
                    options.Conventions.AuthorizeFolder("/Anotacion");
                    options.Conventions.AuthorizeFolder("/Citas");
                    options.Conventions.AuthorizeFolder("/Enfermeras");
                    options.Conventions.AuthorizeFolder("/Familiares");
                    options.Conventions.AuthorizeFolder("/Historia");
                    options.Conventions.AuthorizeFolder("/Medicos");
                    options.Conventions.AuthorizeFolder("/Pacientes");
                    //options.Conventions.AuthorizePage("/Index");
                    options.Conventions.AllowAnonymousToPage("/Privacy");
                }
            );
            Contexto _contexto = new Contexto();
            services.AddSingleton<IRepositorioMedico>(new RepositorioMedico(_contexto));
            services.AddSingleton<IRepositorioEnfermera>(new RepositorioEnfermera(_contexto));
            services.AddSingleton<IRepositorioPaciente>(new RepositorioPaciente(_contexto));
            services.AddSingleton<IRepositorioAnotacion>(new RepositorioAnotacion(_contexto));
            services.AddSingleton<IRepositorioHistoria>(new RepositorioHistoria(_contexto));
            services.AddSingleton<IRepositorioFamiliarDesignado>(new RepositorioFamiliarDesignado(_contexto));
            services.AddSingleton<IRepositorioCita>(new RepositorioCita(_contexto));
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
