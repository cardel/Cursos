#include <iostream>
#include <cmath>

using namespace std;

long recursivo(int n){
  if(n==0){
    return 4;
  }
  else{
    if(n==1){
      return 12;
    }
    else{
      return 3*recursivo(n-1)+4*recursivo(n-2)+n+2+pow(7,n);
    }
  }

}

double formula(int n){
    double A = 2.0/9.0;
    double B = 19.0/8.0;

    return A*pow(4,n)+B*pow(-1,n)-(1.0/6.0)*n-23.0/36.0+pow(7,n)*49.0/24.0;
}

int main() {
  for(int i=0;i<20; i++){
      printf("n %i Recursivo: %ld Fórmula: %f \n",i,recursivo(i),formula(i));
     }
  
}
