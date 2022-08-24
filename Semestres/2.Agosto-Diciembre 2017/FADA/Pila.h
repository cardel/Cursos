#ifndef PILA_H
#define PILA_H

class Pila{
	private:
		int top;
		int arreglo[6];
		int n = 6;
		
    public:
		Pila();
		void Push(int x);
		
		int Pop();
		
		bool EmptyStack();
	
};


#endif
