/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */

#ifndef SALARIO_H
#define SALARIO_H
#include <string>
using std::string;
class Salario{
	protected:
		string descripcion;
		double monto;
		
	public:
		Salario(string descripcion, double monto);
		
		virtual double getSalario()=0;
	
};

#endif
