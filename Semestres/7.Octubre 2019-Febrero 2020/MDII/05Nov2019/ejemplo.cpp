#include <iostream>
#include <string>
#include <cmath>
using namespace std;
 
int ecuacionRecurrencia(int n){
    switch(n){
        case 1:
            return 2;
        case 2:
            return 4;
        case 3:
            return 7;
        default:
            return 2*ecuacionRecurrencia(n-1)+ecuacionRecurrencia(n-2)+ecuacionRecurrencia(n-3);
    }
}
 
string inttobinary(int n){
    string salida = "";
    if(n>0){
        while(n >= 1){
            salida = to_string(n%2)+salida;
            n = n/2;       
        }
       
        if(n==1){
            salida = "1"+salida;
        }
    }
    else{
        salida = "0";
    }
    return salida;
}
 
 
int main(){
 
    //cout << inttobinary(10) << endl;
    for(int i=1; i<=4; i++){
        int contador = 0;
        for(int j=0; j<pow(2,i); j++){
            string equivalente = inttobinary(j);
            size_t found = equivalente.find("000");
            if(found==string::npos){
                //cout << equivalente << endl;
                contador++;
            }
        }
       
        cout << "Bits " <<i<<" : "<<contador<<" Ecuacion recurrencia "<<ecuacionRecurrencia(i)<<endl;
   
    }
}
