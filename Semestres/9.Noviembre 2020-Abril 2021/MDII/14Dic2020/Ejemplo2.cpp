#include <iostream>
#include <cmath>
using namespace std;

double recursivo(int n){
  if(n==0){
    return 4.0;
  }
  else{
    if(n==1){
      return 8.0;
    }
    else{
      return 7*recursivo(n-1)-3*recursivo(n-2);
    }

  }

}


double formula(int n){
  double A = (2.0-6.0/sqrt(37));
  double B = (2.0+6.0/sqrt(37));
  double r1 = pow((7.0+sqrt(37))/2,n);
  double r2 = pow((7.0-sqrt(37))/2,n);

  return A*r1+B*r2;
}

int main() {
    for(int i = 0; i<20; i++){

      cout <<" n "<< i <<"recursiva: " << recursivo(i) << " formula "<< formula(i) << endl;
    }
}