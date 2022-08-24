using System;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia
{

    public class Contexto : DbContext
    {
        public DbSet<Persona> Personas { get; set; }
        public DbSet<Medico> Medicos { get; set; }
        public DbSet<Paciente> Pacientes {get; set; }


        public DbSet<Enfermera> Enfermeras{get; set; }
        public DbSet<Familiar_Designado> Familiares_Designados {get; set;}
        public DbSet<Historia> historias{get; set;}
        public DbSet<Anotacion> anotaciones{get; set;}
        public DbSet<Cita> Citas { get; set;}

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            if (!options.IsConfigured)
            {
                options.UseSqlServer("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = HospitalEnCasaG3");
            }
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Persona>()
                .HasIndex(u => u.cedula)
                .IsUnique();
            builder.Entity<Persona>().HasIndex(p => p.username).IsUnique();
        }


    }
}