#include <iostream>
#include <vector>
using namespace std;
 
int main() {
	// your code goes here
    int * a = new int[5];
    
    for(int i=0; i<5; i++){
        a[i] = i*5;
    }
    
    cout << a << endl;
    cout << *a << " " << a[0] << endl;
    cout << *(a+1) << " " << a[1] << endl;
    cout << *(a+2) << " " << a[2] << endl;
    int i = 0;
    while(true){
        cout << *(a+i)<< endl;    
        i++;
    }
}

