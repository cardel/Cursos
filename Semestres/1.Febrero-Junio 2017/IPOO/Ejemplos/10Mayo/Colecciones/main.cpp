#include "Empleado.h"
#include <vector>
#include <iostream>


using namespace std;

int main(){
	int numEmpleados = 0;
	
	cout << "Ingrese el número de empleados" << endl;
	cin >> numEmpleados;
	
	//implementacion array estático
	Empleado listaEstaticaEmpleados[numEmpleados];
	
	for(int i=0; i<numEmpleados; i++){
		string nombre;
		double salario;
		int edad;
		cout << "Ingrese el nombre" << endl;
		cin >> nombre;

		cout << "Ingrese el salario" << endl;
		cin >> salario;
	
		cout << "Ingrese el edad" << endl;
		cin >> edad;
		
		listaEstaticaEmpleados[i] = Empleado(nombre, salario, edad);
	}
	
	//Lista dinámica de empleados
	
	Empleado * listaDinamicaEmpleados[numEmpleados];

	for(int i=0; i<numEmpleados; i++){
		string nombre;
		double salario;
		int edad;
		cout << "Ingrese el nombre" << endl;
		cin >> nombre;

		cout << "Ingrese el salario" << endl;
		cin >> salario;
	
		cout << "Ingrese el edad" << endl;
		cin >> edad;
		
		listaDinamicaEmpleados[i] = new Empleado(nombre, salario, edad);
	}

	vector<Empleado> vectorEstaticoEmpleado;
	

	for(int i=0; i<numEmpleados; i++){
		string nombre;
		double salario;
		int edad;
		cout << "Ingrese el nombre" << endl;
		cin >> nombre;

		cout << "Ingrese el salario" << endl;
		cin >> salario;
	
		cout << "Ingrese el edad" << endl;
		cin >> edad;
		
		vectorEstaticoEmpleado.push_back(Empleado(nombre, salario, edad));
	}

	vector<Empleado*> vectorDinamicoEmpleado;
	

	for(int i=0; i<numEmpleados; i++){
		string nombre;
		double salario;
		int edad;
		cout << "Ingrese el nombre" << endl;
		cin >> nombre;

		cout << "Ingrese el salario" << endl;
		cin >> salario;
	
		cout << "Ingrese el edad" << endl;
		cin >> edad;
		
		vectorDinamicoEmpleado.push_back(new Empleado(nombre, salario, edad));
	}


}
