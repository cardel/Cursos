#include <iostream>
#include <vector>
#include <map>
using namespace std;


int main(){
	
	map<char, int> mapa;
	
	mapa['a'] = 1000;
	mapa['b'] = 10000;
	mapa['z'] = 20000;
	
	for(map<char,int>::iterator iti = mapa.begin(); iti!=mapa.end(); iti++){
		cout << " Llave: "<<iti->first<<" valor: "<<iti->second<<endl;
		
	}
	
	cout<<mapa['a']<<endl;
	
}
