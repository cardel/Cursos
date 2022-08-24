/*
 * Autor: Carlos Andres Delgado
 * Descripción: Implementación clase bicicleta
 * Fecha: 19 de Abril de 2017
*/

#include "Bicicleta.h"


Bicicleta::Bicicleta(){
	this->marca = "Shimano";
	this->color = "";
	this->peso = 0;
	this->size = 0;
}
Bicicleta::~Bicicleta(){}

string Bicicleta::getColor(){
	return color;
}
string Bicicleta::getMarca(){
	return marca;
}
int Bicicleta::getPeso(){
	return peso;
}
int Bicicleta::getSize(){
	return size;
}

void Bicicleta::setColor(string colorIn){
	this->color = colorIn;
}
void Bicicleta::setMarca(string marcaIn){
	this->marca = marcaIn;
}
void Bicicleta::setPeso(int pesoIn){
	this->peso = pesoIn;
}
void Bicicleta::setSize(int sizeIn){
	this->size = sizeIn;
}
