import java.util.*;
import java.util.LinkedList;

public class EjercicioClase{
	
	public static void main(String args[]){
		
		String texto = "([<{abc123abc}>])";
		
		Queue<Character>  colita = new LinkedList();
		Stack<Character> pila = new Stack<Character>();	
		Map<Character, Character> mapa = new HashMap<Character, Character>();

	
		mapa.put('(',')');
		mapa.put('[',']');
		mapa.put('<', '>');
		mapa.put('{', '}');
		mapa.put(')', '(');
		mapa.put('}','{');
		mapa.put('>', '<');
		mapa.put(']', '[');

	
		String brackets = "[({<>})]";
		
		for(int i=0; i<(int)texto.length(); i++){
			for(int j=0; j<(int)brackets.length(); j++){
				if(texto.charAt(i) == brackets.charAt(j)){
					colita.add(texto[i]);
					pila.push(texto[i]);
				}
			}
		
		}

	
		for(int i=0; i<(int)texto.length(); i++){
			if(mapa.get(colita.peek()) != pila.peek()){
				System.out.println("false");
				return;
			}
			colita.remove();
			pila.pop();
		}
		System.out.println("true");
				
	}
}
