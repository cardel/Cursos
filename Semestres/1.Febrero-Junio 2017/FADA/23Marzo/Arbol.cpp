#include "Arbol.h"
#include <iostream>
using namespace std;

Arbol::Arbol(int valor){
	this->valor = valor;
	hijoIzq = 0;
	hijoDer = 0;
}
Arbol::Arbol(int valor, Arbol * hijoIzq,Arbol * hijoDer){
	this->valor = valor;
	this->hijoIzq = hijoIzq;
	this->hijoDer = hijoDer;	
	
}
		
void Arbol::setHijoDer(Arbol * hijoDer){
	this->hijoDer = hijoDer;
}
void Arbol::setHijoIzq(Arbol * hijoIzq){
	this->hijoIzq = hijoIzq;
}

int main(){
	
	Arbol * objArbol = new Arbol(
		5,
		new Arbol(8, new Arbol(10),new Arbol(11)),
		new Arbol(9)	
	);
	
	Arbol objArbolE = Arbol(5);
	cout << (8*sizeof(objArbol)) << endl;
	cout << (8*sizeof(objArbolE)) << endl;	
}
