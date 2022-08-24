#include <iostream>
#include <cmath>


long solucionRecursiva(int n){
  if(n==1) {return 16;}
  else{
    return 3*solucionRecursiva(n/2)+pow(n,2);
    }
}

long solucionFormula(int n){
  return 12*pow(n,(log(3)/log(2)))+4*pow(n,2);
}

int main() {
  for(int i=1;i<=2000;i*=2){
    printf("n %i Recursiva: %ld Formula %ld\n",i,solucionRecursiva(i),solucionFormula(i));
  }
}
