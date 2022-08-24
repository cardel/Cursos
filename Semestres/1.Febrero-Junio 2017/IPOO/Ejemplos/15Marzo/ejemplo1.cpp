/*
 * Autor: Carlos A Delgado
 * Archivo: Ejemplo1.cpp
 * Descripción: Ejemplo retorno void
 * Fecha: 15-Marzo-2017
 */
#include <iostream>

using namespace std;

void funcion(){
	return;
}

bool funcion2(){
	return false;
}

int main(){
	funcion();
	cout << funcion2() << endl;
	return 0;
}
