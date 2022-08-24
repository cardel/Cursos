/*
 * Autor: Carlos Andres Delgado S
 * Fecha: 19 de Abril de 2015
 * Descripción: Implementación main Bicicleta
 */

#include "Bicicleta.h"
#include <iostream>
using namespace std;

int main(){
	//Estatica
	Bicicleta objBici;
	cout << objBici.getMarca() << endl;
	objBici.setColor("Banano");
	cout << objBici.getColor() << endl;
	//Dinamica
	cout << "Mi bicicleta dinamica" << endl;
	Bicicleta * objBiciDinamica = new Bicicleta();
	
	cout << objBiciDinamica->getMarca() << endl;
	objBiciDinamica->setMarca("Pollito");
	cout << objBiciDinamica->getMarca() << endl;

	delete objBiciDinamica;
	objBiciDinamica = 0;
}	
