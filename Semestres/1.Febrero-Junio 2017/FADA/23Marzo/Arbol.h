#ifndef ARBOL_H
#define ARBOL_H

class Arbol{
	private:
		int valor;
		Arbol * hijoIzq;
		Arbol * hijoDer;
	public:
		Arbol(int valor);
		Arbol(int valor, Arbol * hijoIzq,Arbol * hijoDer);
		
		void setHijoDer(Arbol * hijoDer);
		void setHijoIzq(Arbol * hijoIzq);
	
};

#endif
