import java.util.*;

public class Arbol{
	
	private char[][] matrizDejuego;
	
	
	Arbol(char[][] matrizDejuego){
		this.matrizDejuego = matrizDejuego;
		
	}
	public char[][] getMatrizJuegoPro(){
		return matrizDejuego;
	}
	
	public String getMatrizJuego(){
		
		String fila1 = Arrays.toString(matrizDejuego[0]);
		String fila2 = Arrays.toString(matrizDejuego[1]);
		String fila3 = Arrays.toString(matrizDejuego[2]);
		return fila1+"\n"+fila2+"\n"+fila3;
	}
}
