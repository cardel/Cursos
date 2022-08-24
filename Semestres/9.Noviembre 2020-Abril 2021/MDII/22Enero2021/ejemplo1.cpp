#include <iostream>
#include <cmath>


long solucionRecursiva(int n){
  if(n==0) {return 5;}
  else{
    if(n==1) {return 16;}
    else{
      return 4*solucionRecursiva(n-1)-4*solucionRecursiva(n-2)+(7.0)*pow(2,n)+n;
    }
  }

}

long solucionFormula(int n){
  return pow(2,n)+n*pow(2,n)+n+4+(7.0/2.0)*pow(n,2)*pow(2,n);
}

int main() {
  for(int i=0;i<=20;i++){
    printf("n %i Recursiva: %ld Formula %ld\n",i,solucionRecursiva(i),solucionFormula(i));
  }
}
