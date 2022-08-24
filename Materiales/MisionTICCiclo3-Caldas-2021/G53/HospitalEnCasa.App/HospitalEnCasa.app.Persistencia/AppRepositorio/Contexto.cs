using System;
using HospitalEnCasa.app.Dominio;
using Microsoft.EntityFrameworkCore;

namespace HospitalEnCasa.app.Persistencia
{

    public class Contexto : DbContext
    {
        public DbSet<Persona> Personas { get; set; }
        public DbSet<Medico> Medicos { get; set; }
        public DbSet<Paciente> Pacientes { get; set; }
        public DbSet<Enfermera> Enfermeras { get; set; }
        public DbSet<Familiar> Familiares { get; set; }
        public DbSet<Historia> Historias { get; set; }
        public DbSet<Anotacion> Anotaciones { get; set; }
        public DbSet<Cita> Citas { get; set; }
        public DbSet<Administrador> Administradores { get; set; }
        
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            if (!options.IsConfigured)
            {
                options.UseSqlServer("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = HospitalEnCasaG53");
            }
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Persona>()
                .HasIndex(u => u.cedula)
                .IsUnique();
            builder.Entity<Persona>()
                .HasIndex(u => u.username)
                .IsUnique();
            builder.Entity<Historia>()
                .HasIndex(u => u.serial)
                .IsUnique();
        }


    }
}