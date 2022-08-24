#include <iostream>

using namespace std;

int main(){
	
	int p[7]= {30,35,15,5,10,20,25};
	
	int k[6][6];
	int costos[6][6];
	
	for(int i=0; i<6; i++){
		for(int j=0; j<6; j++){
			k[i][j]=0;
			costos[i][j]=0;
		}
	}
	
	//primero llenamos las diagonales
	
	for(int i=0; i<6; i++){
		k[i][i] = 0;
		costos[i][i] = 0;
	}
	
	//segunda diagona
	
	for(int i=0; i<5; i++){
		
		//Calcular el k
		int valorDelK = i;
		
		int valor = costos[i][valorDelK] + costos[i][valorDelK+1] + p[i]*p[valorDelK+1]*p[i+1+1];
		
		k[i][i+1] = i;
		costos[i][i+1] = valor;
		
	}
	
	cout << "Matriz de costos" << endl;
	for(int i=0; i<6; i++){
		for(int j=0; j<6; j++){
			cout << costos[i][j] << " ";
		}
		cout << endl;
		
	}
	cout << "Matriz de los k" << endl;
	for(int i=0; i<6; i++){
		for(int j=0; j<6; j++){
			cout << k[i][j] << "\t";
		}
		cout << endl;
		
	}
	
}
