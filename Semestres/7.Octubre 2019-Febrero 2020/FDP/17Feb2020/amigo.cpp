#include "amigo.h"
using std::string;

Amigo::Amigo(string nombre, int edad, string color_ojos, string cedula, int num_parejas){
		this->nombre = nombre;
		this->edad = edad;
		this->color_ojos = color_ojos;
		this->cedula = cedula;
		this->num_parejas = num_parejas;
	
}


int Amigo::getEdad(){
	return edad;
}
		
void Amigo::setEdad(int edad){
	this->edad = edad;
}
		
bool Amigo::mayorEdad(){
	return this->edad >= 18;
}
