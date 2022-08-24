#include "Empleado.h"

//Esto es requerido por implementación de arreglos
Empleado::Empleado(){
	this->nombre = "";
	this->edad = 0;
	this->salario = 0;
}

Empleado::Empleado(string nombre, int edad, double salario){
	this->nombre = nombre;
	this->edad = edad;
	this->salario = salario;
}

string Empleado::getNombre(){
	return nombre;
}
int Empleado::getEdad(){
	return edad;
}
double Empleado::getSalario(){
	return salario;
}

void Empleado::setNombre(string nombre){
	this->nombre = nombre;
}
void Empleado::setEdad(int edad){
	this->edad = edad;
}
void Empleado::setSalario(double salario){
	this->salario = salario;
}
