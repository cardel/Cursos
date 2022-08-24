#include <cstdio>
#include <cmath>

double fr(int n){
  if(n==0){
    return 4;
  }
  else{ 
    if(n==1){
      return 6;
    }
    else{
        double p = 3*n*n+n;
        return 4*fr(n-1)+7*fr(n-2)+p;
      }
  }

}

double f(int n){

  double a= (2.83715)*pow(-1.3,n);
  double b = (2.32685)*pow(5.3,n);
  double c = (-3.0/10.0)*pow(n,2)-(59.0/50.0)*n-291.0/250.0;
  return a+b+c;
}

int main(){
  for(int i=0; i<7; i++){

    printf("n\t%d\t%f\t",i,f(i));
    printf("n\t%d\t%f\n",i,fr(i));
  }

}
