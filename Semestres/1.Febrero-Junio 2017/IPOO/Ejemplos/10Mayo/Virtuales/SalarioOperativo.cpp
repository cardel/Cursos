/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */
 
 #include "SalarioOperativo.h"
 

SalarioOperativo::SalarioOperativo(string descripcion, double monto):Salario(descripcion, monto){
	
}

double SalarioOperativo::getSalario(){
	return monto;
}

