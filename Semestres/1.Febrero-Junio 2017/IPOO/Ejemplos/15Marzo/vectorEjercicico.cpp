#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main(){
	vector <int> identificaciones;
	vector <string> nombres;
	
	cout << "Ingrese el número de personas" << endl;
	int numPersonas = 0;
	cin >> numPersonas;
	
	for(int i=0; i<numPersonas; i++){
	
		cout << "Ingrese la identificacion de la persona "<<(i+1)<<endl;
		int ident = 0;
		cin >> ident;
		
		identificaciones.push_back(ident);
		
		
		cout << "Ingres el nombre de la persona "<<(i+1)<<endl;
		string nom = "";
		cin >> nom;
		
		nombres.push_back(nom);
		
	
	}
	
	for(int i=0; i<(int)identificaciones.size(); i++){
		cout << "Cedula: "<<identificaciones[i];
		cout << " Nombre: "<<nombres[i]<<endl;
		
	}
	
}
