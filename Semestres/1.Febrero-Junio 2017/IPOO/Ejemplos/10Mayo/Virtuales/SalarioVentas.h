/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */
 
 #ifndef SALARIOVENTAS_H
 #define SALARIOVENTAS_H
 
#include "Salario.h"

 class SalarioVentas : public Salario{
	private:
	
	public:
		SalarioVentas(string descripcion, double monto);
		
		double getSalario();

};
 #endif
