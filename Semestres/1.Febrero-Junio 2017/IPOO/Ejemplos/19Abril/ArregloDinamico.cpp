#include <iostream>

using namespace std;

int main(){
	double ** arreglo2D = new double*[5];
	
	//Construirmos el arreglo 2d
	for(int i=0; i<5; i++){
		arreglo2D[i] = new double[2];
	}
	
	//<Vamos a instanciar/inicializar
	
	for(int i=0; i<5; i++){
		for(int j=0; j<2; j++){
			arreglo2D[i][j] = (double)i;
		}
	}
	
}
