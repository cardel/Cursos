
#include "arbol.h"
#include <string>
#include <cstdio>

using std::string;
Arbol::Arbol(char valor, Arbol * hizq, Arbol * hder, Arbol * hder2){
		this->valor = valor;
		this->hizq = hizq;
		this->hder = hder;
		this->hder2 = hder2;
}

char Arbol::getValor(){
	return this->valor;
}
Arbol * Arbol::getHizq(){
	return this->hizq;
}
Arbol * Arbol::getHder(){
	return this->hder;
}
Arbol * Arbol::getHder2(){
	return this->hder2;
}
     
void recorridoPreorden(Arbol * arb){
	
	if(arb == 0){
		
	}
	else{
		
		string valor = string(1,arb->getValor());
		
		printf("%c ",arb->getValor());
		
		recorridoPreorden(arb->getHizq());
		recorridoPreorden(arb->getHder());
		recorridoPreorden(arb->getHder2());
	
	}
	}
	
void recorridoInorden(Arbol *arb){
	
	if(arb == 0){
		
	}
	else{
		
		string valor = string(1,arb->getValor());
		
		
		recorridoInorden(arb->getHizq());
		printf("%c ",arb->getValor());
		
		
		recorridoInorden(arb->getHder());
		recorridoInorden(arb->getHder2());
	
	}
	}

	
void recorridoPosorden(Arbol *arb){
	
	if(arb == 0){
		
	}
	else{
		
		string valor = string(1,arb->getValor());
		
		
		recorridoPosorden(arb->getHizq());
		recorridoPosorden(arb->getHder());
		recorridoPosorden(arb->getHder2());
		printf("%c ",arb->getValor());
		
		

	
	}
	}

int main(){
	Arbol * arb = new Arbol('a',
		new Arbol('b',
			new Arbol('e', 0, 0,0),
			new Arbol('f',
			       new Arbol('l',0, 0,0),
			       new Arbol('m',0, 0,0),
			       0),
			new Arbol('g',0,0,0)),
			new Arbol('c', 
			       new Arbol('h',0,0,0), new Arbol('i',0,0,0),
			       0
		    ),
			new Arbol('d',
			    new Arbol('j', 
			       new Arbol  ('n',0,0,0),
			       new Arbol('o',0,0,0),
			       0
			      ),
			      new Arbol('k',
			           new Arbol('p',0,0,0),
			           new Arbol('q',0,0,0),
			           0),
			      0));
		recorridoPreorden(arb);	   
		printf("\n");
		recorridoInorden(arb);	
		printf("\n");
		recorridoPosorden(arb);   
			    
}
