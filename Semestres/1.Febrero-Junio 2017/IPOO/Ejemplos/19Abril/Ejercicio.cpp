/*
* Autor: Carlos Andres Delgado
* Descripción: Ejercicio memoria dinámica
* Fecha: 19 de Abril
*/
#include <iostream>
#include <string>

using namespace std;

int recolectar(int * &salarios, int * &edades, string * &nombres){
	int numeroPersonas = 0;
	cout << "Ingrese el número de personas" << endl;
	cin >> numeroPersonas;
	
	salarios = new int[numeroPersonas];
	edades = new int[numeroPersonas];
	nombres = new string[numeroPersonas];
	
	for(int i=0; i<numeroPersonas; i++){
		cout << "Ingrese el nombre" << endl;
		cin >> nombres[i];
		
		cout << "Ingrese la edad" << endl;
		cin >> edades[i];
		
		cout << "Ingrese el salario" << endl;
		cin >> salarios[i];
		
	}
	return numeroPersonas;
}

void imprimir(int * &salarios, int * &edades, string * &nombres, int n){
	
	for(int i=0; i<n; i++){
		cout << "La persona con nombre: "<<nombres[i]<<" tiene "<<edades[i]<<" años y gana "<<salarios[i]<<endl;
	}
}

int main(){
	int * salarios;
	int * edades;
	string * nombres;
	int n = recolectar(salarios, edades, nombres);
	imprimir(salarios, edades, nombres, n);
}
