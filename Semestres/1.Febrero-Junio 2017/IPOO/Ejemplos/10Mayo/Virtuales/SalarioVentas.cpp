/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */
 
 #include "SalarioVentas.h"
 

SalarioVentas::SalarioVentas(string descripcion, double monto):Salario(descripcion, monto){
	
}

double SalarioVentas::getSalario(){
	return 1.25*monto;
}


