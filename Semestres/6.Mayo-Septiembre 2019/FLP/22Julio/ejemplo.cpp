#include <cstdio>


int main(){
	
	int a = 3;
	printf("%i\t%p\n",a,&a);
	
	int b = a;
	printf("%i\t%p\n",b,&b);
	
	int * c = &a;
	printf("%i\t%p\n",*c,c);
	
	*c = 4;
	printf("%i\t%p\n",a,&a	);
		
	
	
	if(a=7){
		printf("%s\n","hola");
	}
	else{
		printf("%s\n","chao");
		}
		
	printf("%d\n",++a);
	
	
}
