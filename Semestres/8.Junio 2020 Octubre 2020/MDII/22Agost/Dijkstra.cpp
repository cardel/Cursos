#include <iostream>
#include <vector>
#include <limits>
#include <string>

using namespace std;

bool encontrar(vector<int> recorrido, int num){
  for(int i=0; i<recorrido.size(); i++){
    if(recorrido[i]==num){
      return true;
    }
  }
  return false;
}

void algoritmoDijkstra(int ma[6][6], int inicial, int fin){
  //Distancia desde el inicial hasta el vertice
  vector<double> dist(6,numeric_limits<double>::infinity());

  dist[inicial] = 0;

  vector<int> recorrido;
  recorrido.push_back(inicial);
  int actual = inicial;

  bool marcados[] = {false,false,false,false,false,false};
  marcados[inicial] = true;
  
  while(!encontrar(recorrido, fin)){

    for(int j=0; j<6; j++){

      if(ma[actual][j]){

        //Costo de ir del actual a j
        int costo = dist[actual] + ma[actual][j];
        //Actualizo el costo si es mejor el que está
        if(dist[j]>costo){
          dist[j] = costo;

        }

      }
    }
    //Actualizar el vértice actual
    //Debo encontrar el vertice que tiene menor costo
    double costoAcc = numeric_limits<double>::infinity();

    for(int i=0; i<dist.size(); i++){
      if(!marcados[i]){
        if(costoAcc>dist[i]){

          costoAcc = dist[i];
          actual = i;
        }

      }

    }
    //Agrego el nuevo nodo como recorrido
    recorrido.push_back(actual);
    //Marco como recorrido
    marcados[actual] = true;
    cout << actual << endl;

  }

  //Desplegamos la información
  string ciudades[] = {"Bogota","Lima","Quito","La paz", "Asunción","Buenos Aires"};
  for(int i=0; i<recorrido.size(); i++){
    string a = ciudades[recorrido[i]];
    cout << a << " ";
  }
  cout<<endl;
  //Imprimo el costo
  cout << "El costo total: " << dist[fin] << endl;
}


int main() {
 //Se supone que esto se va cargar desde UN ARCHIVO
  int ma[6][6] = { {0, 4, 2, 0, 0, 0}, 
                {4, 0, 1, 5, 7, 0}, 
                {2, 1, 0, 8, 10, 0}, 
                {0, 5, 8, 0, 2, 6}, 
                {0, 7, 10, 2, 0, 3}, 
                {0, 0, 0, 6, 3, 0}, 
  };
  int inicial = 0;
  int fin = 0;
  cout << "Ingrese el inicial y el final \n";
  cin>>inicial;
  cin>>fin;
  algoritmoDijkstra(ma,inicial, fin);
}
