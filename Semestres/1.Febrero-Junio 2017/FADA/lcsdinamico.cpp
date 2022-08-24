/*
 * Autor: Carlos Anrdres Delgado
 * Descripción: LCS dinámico
 */
#include <iostream>
#include <string>
#include <cmath>
using namespace std;
int main(){
	string palabraA, palabraB;
	cout << "Ingrese la primera palabra\n";
	cin >> palabraA;

	cout << "Ingrese la segunda palabra\n";
	cin >> palabraB;

	int sizePalabraA = palabraA.length();
	int sizePalabraB = palabraB.length();
	
	int costos[sizePalabraA+1][sizePalabraB+1];
	
	for(int i=0; i<sizePalabraA+1; i++){
		for(int j=0; j<sizePalabraB+1; j++){
				if(i==0 || j==0){
					costos[i][j] = 0;
				}
				else{
				//Cuando son iguales
				//Preguntamos por la posición i-1 o j-1 en la palabra
				//debido a que estamos adelantados a una posición
				if(palabraA[i-1]==palabraB[j-1]){
					costos[i][j] = costos[i-1][j-1]+1;
				}
				else{
				//CUando son diferentes
					costos[i][j]=max(costos[i-1][j],costos[i][j-1]);
				}
			}
		}
		
	}

	for(int i=0; i<sizePalabraA+1; i++){
		for(int j=0; j<sizePalabraB+1; j++){
			cout << costos[i][j]<< " ";
		}
		cout << endl;
	}
	
	//Pensemos: ¿COmo pintar la solución?
	string solucion = "";
	int posA = sizePalabraA;
	int posB = sizePalabraB;
	while(true){
		
		if(posA == 0 || posB == 0){
			break;
		}
		else{
			if(palabraA[posA-1]==palabraB[posB-1]){
					solucion = palabraA[posA-1]+solucion;
					posA--;
					posB--;
			}else{
				int cArriba = costos[posA-1][posB];
				int cIzquierda = costos[posA][posB-1];
				
				if(cArriba >= cIzquierda){
					posA--;
					
				}
				else{
					posB--;
				}
				
			}
		}
		
	}
	cout << solucion << endl;
	
}
