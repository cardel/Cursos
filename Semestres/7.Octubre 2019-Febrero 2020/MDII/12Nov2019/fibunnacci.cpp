#include <cstdio>

int contador1 = 0;
int contador2 = 0;

int fibunnaci(int n){
  contador1++;
   if(n==0){

    return 1;
  }
  else{
    if(n==1){

      return 1;
    }else{

      return fibunnaci(n-1)+fibunnaci(n-2);
    }

  }

}

int main() {
  int fn_2 = 1;
  int fn_1 = 1;
  int n = 20;

  fibunnaci(n);

  for(int i=0; i<n; i++){
      
    int fn = fn_1 + fn_2;
    fn_2 = fn_1;
    fn_1 = fn;
    contador2++;
  }
  printf("%d\t%d\n",contador1,contador2);
  return 0;
}
