/*
* Autor: Carlos Andres Delgado
* Descripción: Ejemplo tiempo
* Fecha: 28 de Marzo
*/
#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;


int main(){
	time_t tiempo;
	
	time(&tiempo);
	
	cout << tiempo << endl;
	//Esto es la semilla del número aleatorio
	//Es una indicación de cómo comenzar
	//T(n) = (T(n-1)+c)mod m
	// c = 0, m = 2^16
	srand(tiempo);
	for(int i=0; i<10; i++){
		int a = rand()%11;
		cout << a << " ";
	}
}
