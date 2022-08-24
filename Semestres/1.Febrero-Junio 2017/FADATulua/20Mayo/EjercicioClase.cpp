#include <iostream>
#include <string>
#include <queue>
#include <stack>
#include <map>
using namespace std;

int main(){
	//string texto = "([<{abc123abc}>])";
	string texto = "(abc[123)abc]";
	queue<char> colita;
	stack<char> pila;
	map<char,char> mapa;
	
	mapa['('] = ')';
	mapa['['] = ']';
	mapa['<'] = '>';
	mapa['{'] = '}';
	mapa[')'] = '(';
	mapa['}'] = '{';
	mapa['>'] = '<';
	mapa[']'] = '[';

	
	string brackets = "[({<>})]";
	
	for(int i=0; i<(int)texto.size(); i++){
		for(int j=0; j<(int)brackets.size(); j++){
			if(texto[i] == brackets[j]){
				colita.push(texto[i]);
				pila.push(texto[i]);
			}
		}
		
	}

	
	for(int i=0; i<(int)colita.size(); i++){
		if(mapa[colita.front()] != pila.top()){
			cout << "false" << endl;
			return 0;
		}
		colita.pop();
		pila.pop();
	}
	cout << "true" << endl;
}
