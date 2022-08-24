/*
 * Carlos Andres Delgado S
 * Descripción: Ejemplo clase
 * Fecha: 10 de Mayo de 2017
 */

#include <iostream>
#include "SalarioVentas.h"
#include "SalarioOperativo.h"
#include "SalarioAdministrativo.h"

using namespace std;

int main(){
	SalarioVentas * objSalarioVentas = new SalarioVentas("Ventas", 100);
	
	cout << objSalarioVentas->getSalario() << endl;

	SalarioOperativo* objSalarioOperativo = new SalarioOperativo("Operativo", 100);
	
	cout << objSalarioOperativo->getSalario() << endl;


	SalarioAdministrativo * objSalarioAdministrativo = new SalarioAdministrativo("Admin", 100);
	
	cout << objSalarioAdministrativo->getSalario() << endl;

}
