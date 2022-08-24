using Microsoft.EntityFrameworkCore;
using ReservaRestaurante.App.Dominio;

namespace ReservaRestaurante.App.Persistencia{
    public class Contexto: DbContext{
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Mesa> Mesas { get; set; }
        public DbSet<Mesero> Meseros {get; set; }
        public DbSet<Reserva> Reservas { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder opciones) {
            if(!opciones.IsConfigured){
                //opciones.UseSqlServer("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog=ReservaRestaurante");
                 opciones.UseMySQL("server=localhost;database=reserva;user=cardel;password=cardelMintic");

            }
        }

        /*
        Esto permite volver un atributo como único
        */
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Cliente>()
                .HasIndex(u => u.cedula)
                .IsUnique();
            builder.Entity<Mesero>()
                .HasIndex(u => u.cedula)
                .IsUnique();
            builder.Entity<Mesa>()
                .HasIndex(u => u.numero)
                .IsUnique();
        } 
    }
}