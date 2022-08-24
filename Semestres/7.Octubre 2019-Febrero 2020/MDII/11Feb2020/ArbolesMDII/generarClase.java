import java.util.Vector;

public class generarClase{

		public Vector<Arbol> jugar(char[][] matrizDejuego, char jugador){
			
			Vector<Arbol> hijosGenerados = new Vector<Arbol>();
			
			for(int i=0; i<matrizDejuego.length; i++){
				for(int j=0; j<matrizDejuego[0].length; j++){
						if(matrizDejuego[i][j] == '-'){
							
							//Para copiar un array 2D necesito el loop (for)
							char[][] matrizActual = new char[3][3];
							
							for(int k=0; k<matrizDejuego.length; k++){
								for(int l=0; l<matrizDejuego[0].length; l++){
									matrizActual[k][l] = matrizDejuego[k][l];
								}
							}
							matrizActual[i][j] = jugador;
							
							Arbol hijoNuevo = new Arbol(matrizActual);
							hijosGenerados.addElement(hijoNuevo);
							//System.out.println(hijoNuevo.getMatrizJuego());
						}
						
				}	
			}
			
		return hijosGenerados;
			
		}
		


	public void generacion(){
			char[][] matrizInicial ={{'x','x','o'},{'x','-','-'},{'o','o','-'}};
	

			Arbol objArbol = new Arbol(matrizInicial);
			
			System.out.println(objArbol.getMatrizJuego());
			
			System.out.println("Inicio hijos");
			
			
			while(true){
				char[][] matrizCopia = objArbol.getMatrizJuegoPro();
				Vector<Arbol> hijosGenerados = jugar(matrizCopia,'x');
				
				for(int i=0;i<hijosGenerados.size(); i++){
					
					
					Arbol arbolActual = hijosGenerados.elementAt(i);
					System.out.println("Primer nivel\n");
					
					char[][] matrizHijito = arbolActual.getMatrizJuegoPro();
					System.out.println(arbolActual.getMatrizJuego());	
					
					Vector<Arbol> hijosGeneradosSegundoNivel = jugar(matrizHijito,'o');
				
					for(int k=0; k<hijosGeneradosSegundoNivel.size(); k++){
						Arbol hijoSegundoNivel = hijosGeneradosSegundoNivel.elementAt(k);
						System.out.println(hijoSegundoNivel.getMatrizJuego());	
					}
					
					
				
				}
				//ROmpe el ciclo cuando no tiene más hijos que explorar
				break;
								
			}
		
		
	}

}
