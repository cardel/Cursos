using Microsoft.EntityFrameworkCore.Migrations;

namespace RedSocialPerros.App.Persistencia.Migrations
{
    public partial class Inicial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Perros",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    nombre = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    raza = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    edad = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Perros", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Amistades",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    perroAId = table.Column<int>(type: "int", nullable: true),
                    perroBId = table.Column<int>(type: "int", nullable: true),
                    fecha_amistad = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Amistades", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Amistades_Perros_perroAId",
                        column: x => x.perroAId,
                        principalTable: "Perros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Amistades_Perros_perroBId",
                        column: x => x.perroBId,
                        principalTable: "Perros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Personas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    nombre = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    edad = table.Column<double>(type: "float", nullable: false),
                    perroId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Personas", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Personas_Perros_perroId",
                        column: x => x.perroId,
                        principalTable: "Perros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Amistades_perroAId",
                table: "Amistades",
                column: "perroAId");

            migrationBuilder.CreateIndex(
                name: "IX_Amistades_perroBId",
                table: "Amistades",
                column: "perroBId");

            migrationBuilder.CreateIndex(
                name: "IX_Personas_perroId",
                table: "Personas",
                column: "perroId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Amistades");

            migrationBuilder.DropTable(
                name: "Personas");

            migrationBuilder.DropTable(
                name: "Perros");
        }
    }
}
