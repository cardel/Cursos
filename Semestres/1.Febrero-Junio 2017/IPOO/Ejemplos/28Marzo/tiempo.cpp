/*
* Autor: Carlos Andres Delgado
* Descripción: Ejemplo tiempo
* Fecha: 28 de Marzo
*/
#include <iostream>
#include <ctime>

using namespace std;


int main(){
	time_t tiempo;
	
	time(&tiempo);
	
	cout << tiempo << endl;
	cout << ctime(&tiempo) << endl;
	
	time_t tiempoB = (-1)*tiempo;
	cout << ctime(&tiempoB) << endl;
	//Esta estructura permite colocar el tiempo directamente
	struct tm fechaN= {0};
	
	fechaN.tm_hour = 12;
	fechaN.tm_min = 0;
	fechaN.tm_year = 96;
	fechaN.tm_mon = 3;
	fechaN.tm_mday = 14;
	
	time_t fechaNacimiento = mktime(&fechaN);
	cout << ctime(&fechaNacimiento) << endl; 
	time_t diferencia = tiempo - fechaNacimiento;
	
	cout <<diferencia << " segundos"<<endl;
	cout << diferencia/60 << " minutos" << endl;
	cout << diferencia/3600 << " horas" << endl;
	cout << diferencia/(24*3600) << " días" << endl;
	cout << diferencia/(365.25*24*3600) << " años" << endl;

	
}
