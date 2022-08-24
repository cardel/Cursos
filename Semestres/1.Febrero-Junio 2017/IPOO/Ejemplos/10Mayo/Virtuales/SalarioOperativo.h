/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */
 
 #ifndef SALARIOOPERATIVO_H
 #define SALARIOOPERATIVO_H
 
 #include "Salario.h"
 
 class SalarioOperativo : public Salario{
	private:
	
	public:
		SalarioOperativo(string descripcion, double monto);
		
		double getSalario();

};
 
 #endif
