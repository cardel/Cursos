class Arbol{

	private int valor;
	private Arbol hijoIzq;
	private Arbol hijoDer;
	
	Arbol(int valor){
		this.valor = valor;
		hijoDer = null;
		hijoIzq = null;
	}
	
	Arbol(int valor, Arbol hijoIz, Arbol hijoDer){
		this.hijoIzq = hijoIz;
		this.hijoDer = hijoDer;
		this.valor = valor;
	}
	
	public int getValor(){ return valor; }
	public Arbol getHijoIzq(){return hijoIzq; }
	public Arbol getHijoDer(){return hijoDer; }
	
	public void setHijoIzq(Arbol hijoIzq){
		this.hijoIzq = hijoIzq;
	}
	
	public void setHijoDer(Arbol hijoDer){
		this.hijoDer = hijoDer;
	}
		
	public static void main(String args[]){
		
		//Declaración recursiva
		Arbol objArbol = new Arbol(
			5,
			new Arbol(8, (new Arbol(10)), (new Arbol(11))),
			new Arbol(9)
		);
		
		//Declaración imperativa
		//Esta implementación es costosa
		//En lo posible usar la primera
		Arbol raiz = new Arbol(5);
		Arbol hijoIzq = new Arbol(8);
		Arbol hijoIzqHijoIzq = new Arbol(10);
		Arbol hijoDerHijoIzq = new Arbol(11);
		Arbol hijoDer = new Arbol(9);
		
		hijoIzq.setHijoDer(hijoDerHijoIzq);
		hijoIzq.setHijoIzq(hijoIzqHijoIzq);
		
		raiz.setHijoDer(hijoDer);
		raiz.setHijoIzq(hijoIzq);
		
		System.out.println(sumarNodo(objArbol));
		System.out.println(sumarNodo(raiz));
	}
	
	public static int sumarNodo(Arbol arbol){
		if(arbol.getHijoIzq() != null && arbol.getHijoDer() != null){
			return arbol.getValor() + sumarNodo(arbol.getHijoIzq()) + sumarNodo(arbol.getHijoDer());
		}
		else{
			if(arbol.getHijoIzq()!=null && arbol.getHijoDer() == null){
				return arbol.getValor() + sumarNodo(arbol.getHijoIzq());
			}
			else{
				if(arbol.getHijoIzq()==null && arbol.getHijoDer() != null){
					return arbol.getValor() + sumarNodo(arbol.getHijoDer());
				}
				else{
					return arbol.getValor();
				}
			}
		}
	}

}
