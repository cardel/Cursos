#include <iostream>
#include <cmath>
using namespace std;

long algoritmo1(long n){
    long cnt = 1; //Cuenta la primera linea
    long i = 1;
    while(i <= n){
        cnt++; //Contar i<=n validos
        int k = i;
        cnt++; //int k = i;

        while(k<=n){
            cnt++; //k<=n
            k = k+2;   
            cnt++;         
        }
        cnt++; //Salida while interno
        k = 1;
        cnt++; //k=1
        while(k<=i){
            cnt++; //k<=i>
            k+=1;
            cnt++; //k+=1
        }
        cnt++; //Salida while interno
        i *= 2;
        cnt++; //i*=2;
    }
    cnt++; //Salida while
    return cnt++;
}

int main(){
    for(int i=0; i<=10; i++){
        double n = pow(2,i);
        double formula = 6+4*log2(n);
        double formula2 = n/2+1+log2(n)*(n/2+2)-(n-1);
        double formula22 = n/2+log2(n)*(n/2+1)-(n-1);
        double formula3 = log2(n)+2*n+2*n-1;
        cout << n << " " << algoritmo1(n) << " " << formula+formula2+formula22+formula3 <<endl;
    }
}