/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */
 
 #include "SalarioAdministrativo.h"
 

SalarioAdministrativo::SalarioAdministrativo(string descripcion, double monto):Salario(descripcion, monto){
	
}

double SalarioAdministrativo::getSalario(){
	return 1.5*monto;
}


