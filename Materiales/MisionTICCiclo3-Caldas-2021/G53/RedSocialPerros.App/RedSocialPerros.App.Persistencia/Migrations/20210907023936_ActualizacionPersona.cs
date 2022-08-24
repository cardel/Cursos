using Microsoft.EntityFrameworkCore.Migrations;

namespace RedSocialPerros.App.Persistencia.Migrations
{
    public partial class ActualizacionPersona : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "nombre",
                table: "Personas",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Personas_nombre",
                table: "Personas",
                column: "nombre",
                unique: true,
                filter: "[nombre] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Personas_nombre",
                table: "Personas");

            migrationBuilder.AlterColumn<string>(
                name: "nombre",
                table: "Personas",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);
        }
    }
}
