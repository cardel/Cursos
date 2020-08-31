// Example program
#include <iostream>
using namespace std;


int funcionFloat()
{
  float a = 3.14545454;
  float b = 3.111;
  float c = a + b;
 cout << "Con float" << endl;
  cout << a << endl;
  cout << b << endl;
  cout << c << endl;
}
int funcionDouble()
{
  double a = 3.14545454;
  double b = 3.111;
  double c = a + b;
  cout << "Con double" << endl;
  cout << a << endl;
  cout << b << endl;
  cout << c << endl;
}

int main(){
    cout.precision(15);
    funcionFloat();
    funcionDouble();
}