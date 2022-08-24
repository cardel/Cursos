/*
 * Autor: Carlos A Delgado
 * Archivo: Ejemplo1.cpp
 * Descripción: Ejemplo retorno void
 * Fecha: 15-Marzo-2017
 */
#include <iostream>
#include <string>
using namespace std;

int main(){
	string nombre="carlos";
	
	cout << (nombre.compare("sebastian") == 0)<<endl;
	cout << (nombre.compare("camilo") == 0)<<endl;
	cout << (nombre.compare("Carlos") == 0)<<endl;
	cout << (nombre.compare("carlos") == 0)<<endl;
	
	if(nombre.compare("juan")==0){
		cout << "El nombre es juan"<<endl;
	}
}
