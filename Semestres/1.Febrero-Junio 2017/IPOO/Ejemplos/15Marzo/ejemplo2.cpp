/*
 * Autor: Carlos A Delgado
 * Archivo: Ejemplo1.cpp
 * Descripción: Ejemplo retorno void
 * Fecha: 15-Marzo-2017
 */
#include <iostream>

using namespace std;

int main(){
	
	int variable = 3;
	cout << variable << endl;
	cout << &variable << endl;
	
	cout << sizeof(variable) << endl;
	cout << sizeof(&variable) << endl;	
	
	int arreglo[100];
	
	cout << sizeof(arreglo) << endl;
	cout << sizeof(&arreglo) << endl;
	
	
}
