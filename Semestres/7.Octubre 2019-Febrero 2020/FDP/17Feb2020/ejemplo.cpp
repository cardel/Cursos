#include <iostream>
#include <cmath>
#include "amigo.h"
using std::string;

using namespace std;

int elevarAlCuadrado(int x){
	cout << "Elevando al cuadrado a x" << endl;

	return x*x;
}

int main(){

	int numeroA = 0;
	//-2^31 hasta 2^31 -1 
	long numeroC = 0;
	//-2^63 hasta 2^63 -1 

	double numeroB = 5.4;
	
	int listaNumero[10] = {1,2,3,4,5,6,7,8,9,10};
	
	int listaNumroB[10];

	for(int i=0; i<10; i++){
		listaNumero[i] = elevarAlCuadrado(listaNumero[i]);
	}
	
	for(int i=0; i<10; i++){
		cout << listaNumero[i] << endl;
	}
	
	Amigo objAmigo = Amigo("Pedro",20,"Cafe","1234",32);
	
	cout << "Edad de mi amigo" << endl;
	
	cout << objAmigo.getEdad() << endl;
	
	objAmigo.setEdad(30);
	
	cout << objAmigo.getEdad() << endl;

	Amigo objAmigo2 = Amigo("Juan",25,"Verdes","4568",2);
	
	return 0;
}
