using Microsoft.EntityFrameworkCore.Migrations;

namespace TicketMetro.App.Persistencia.Migrations
{
    public partial class Cedula : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "cedula",
                table: "Personas",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Personas_cedula",
                table: "Personas",
                column: "cedula",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Personas_cedula",
                table: "Personas");

            migrationBuilder.DropColumn(
                name: "cedula",
                table: "Personas");
        }
    }
}
