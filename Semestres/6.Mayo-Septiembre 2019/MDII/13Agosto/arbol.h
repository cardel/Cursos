#ifndef ARBOL_H
#define ARBOL_H

class Arbol{
	private:
		char valor;
		Arbol * hizq;
		Arbol * hder;
		Arbol * hder2;
	
	public:
		Arbol(char valor, Arbol * hizq, Arbol * hder, Arbol * hder2);
		
		char getValor();
		Arbol * getHizq();
		Arbol * getHder();
		Arbol * getHder2();
	
};

#endif
