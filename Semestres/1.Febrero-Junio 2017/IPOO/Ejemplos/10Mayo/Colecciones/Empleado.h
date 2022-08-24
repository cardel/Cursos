/*
 * AUtor: Carlos ANdres Delgado
 * Descripción: Ejemplo clase de colecciones de objetos
 * Fecha. 10 de Mayo de 2017
 */

#ifndef EMPLEADO_H
#define EMPLEADO_H
#include <string>

using std::string;

class Empleado{
	private:
		string nombre;
		int edad;
		double salario;

	public:
		Empleado();
		Empleado(string nombre, int edad, double salario);
		
		string getNombre();
		int getEdad();
		double getSalario();
		
		void setNombre(string nombre);
		void setEdad(int edad);
		void setSalario(double salario);
};

#endif
