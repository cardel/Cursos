using Microsoft.EntityFrameworkCore.Migrations;

namespace TicketMetro.App.Persistencia.Migrations
{
    public partial class CodEstacion : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "cod_estacion",
                table: "Estaciones",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Estaciones_cod_estacion",
                table: "Estaciones",
                column: "cod_estacion",
                unique: true,
                filter: "[cod_estacion] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Estaciones_cod_estacion",
                table: "Estaciones");

            migrationBuilder.DropColumn(
                name: "cod_estacion",
                table: "Estaciones");
        }
    }
}
