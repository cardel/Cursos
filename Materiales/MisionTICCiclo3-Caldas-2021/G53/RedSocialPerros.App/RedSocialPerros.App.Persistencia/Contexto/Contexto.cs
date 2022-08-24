using Microsoft.EntityFrameworkCore;
using RedSocialPerros.App.Dominio;

namespace RedSocialPerros.App.Persistencia{
    public class Contexto : DbContext{
        public DbSet<Persona> Personas { get; set; }
        public DbSet<Perro> Perros { get; set; }
        public DbSet<Amistad> Amistades { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder opciones) {
            if(!opciones.IsConfigured){
                opciones.UseSqlServer("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog=RedSocialPerros");
            }
        }  
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Persona>()
                .HasIndex(u => u.cedula)
                .IsUnique();
            builder.Entity<Perro>()
                .HasIndex(u => u.numero_registro)
                .IsUnique();
        }      
    }

}