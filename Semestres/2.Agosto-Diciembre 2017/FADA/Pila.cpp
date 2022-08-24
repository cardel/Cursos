
// Example program
#include <iostream>
#include <string>
#include "Pila.h"
using namespace std;


Pila::Pila(){
	top = 0;
	for(int i=0; i<6; i++){
		arreglo[i]=0;    
	}
}

void Pila::Push(int x){
	top = top+1;
	if(top<=6){
		arreglo[top-1]=x;    
		
	}
	else{
		cout << "Overflow\n";    
	}
		
}

int Pila::Pop(){
	
	if(top==0){
		cout << "Underflow\n";
		return 0;
	}else{
		int elemento = arreglo[top-1];
		top-=1;
		return elemento;
	}
	
		
}

bool Pila::EmptyStack(){
	
	if(top==0) return true;
	return false;
}





int main()
{
    Pila *objPila = new Pila();
    cout << objPila->EmptyStack() << endl;
    objPila->Push(2);
    objPila->Push(5);
    cout << objPila->EmptyStack() << endl;
    cout << objPila->Pop() << endl;
    cout << objPila->EmptyStack() << endl;


}

