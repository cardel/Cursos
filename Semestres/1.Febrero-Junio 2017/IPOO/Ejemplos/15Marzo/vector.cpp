#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main(){
	//Creamos un vector de enteros
	vector<int> miVectorEntero;
	//Creamos un vector de cadenas de texto
	vector<string> miVectorTexto;
	//Insertamos
	cout <<"inicial "<<sizeof(miVectorEntero)*8<<endl;
	miVectorEntero.push_back(999); //Posición 0 del vector
	cout <<"inserto "<<sizeof(miVectorEntero)*8<<endl;
	miVectorEntero.push_back(888); //Posición 1 del vector
	cout <<"inserto "<<sizeof(miVectorEntero)*8<<endl;

	miVectorEntero.push_back(23); //Posición 2 del vector
	cout <<"inserto "<<sizeof(miVectorEntero)*8<<endl;
	
	for(int i=0; i<20000; i++){
		miVectorEntero.push_back(i); //Posición 2 del vector
		cout <<"inserto "<<sizeof(miVectorEntero)*8<<endl;
		cout << "tamaño" <<miVectorEntero.size()<< endl;
		
	}
	int size = 0;
	for(int i=0; i<miVectorEntero.size(); i++){
		cout << "Tamaño posición "<<i<<" "<<sizeof(miVectorEntero[i])*8<<endl;
		
	}
		/*
	miVectorTexto.push_back("Hola"); //Posición 0 del vector
	miVectorTexto.push_back("Como estás"); //Posición 1 del vector

	//Consultemos los datos
	for(int i=0; i<(int)miVectorEntero.size(); i++){
		cout << miVectorEntero[i] << endl;
	}
	//Eliminemos el segundo elemento
	miVectorEntero.erase (miVectorEntero.begin()+1);


	//Consultemos los datos
	for(int i=0; i<(int)miVectorEntero.size(); i++){
		cout << miVectorEntero[i] << endl;
	}	
	*/
}
