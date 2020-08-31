// Example program
#include <iostream>
using namespace std;


int funcionFloat()
{
  float a = 1545454545.55;
  float b = 10.3;
  float c = a + b;
 cout << "Con float" << endl;
  cout << a << endl;
  cout << b << endl;
  cout << c << endl;
}
int funcionDouble()
{
  double a = 1545454545.55;
  double b = 10.3;
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