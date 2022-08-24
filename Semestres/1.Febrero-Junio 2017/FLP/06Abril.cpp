#include <iostream>

using namespace std;

int funcion(int &a){
	a += 9;
	return a;
}

int main(){
	int x = 8;
	cout << funcion(x) << endl;
	cout << x << endl;
}
