using Microsoft.EntityFrameworkCore.Migrations;

namespace RedSocialPerros.App.Persistencia.Migrations
{
    public partial class ActualizacionTablas : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.AddColumn<int>(
                name: "cedula",
                table: "Personas",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "numero_registro",
                table: "Perros",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Personas_cedula",
                table: "Personas",
                column: "cedula",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Perros_numero_registro",
                table: "Perros",
                column: "numero_registro",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Personas_cedula",
                table: "Personas");

            migrationBuilder.DropIndex(
                name: "IX_Perros_numero_registro",
                table: "Perros");

            migrationBuilder.DropColumn(
                name: "cedula",
                table: "Personas");

            migrationBuilder.DropColumn(
                name: "numero_registro",
                table: "Perros");

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
    }
}
