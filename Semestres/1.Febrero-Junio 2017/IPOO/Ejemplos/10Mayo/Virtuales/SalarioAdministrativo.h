/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */
 
 #ifndef SALARIOADMINISTRATIVO_H
 #define SALARIOADMINISTRATIVO_H
 
#include "Salario.h"

 class SalarioAdministrativo : public Salario{
	private:
	
	public:
		SalarioAdministrativo(string descripcion, double monto);
		
		double getSalario();

};
 #endif
