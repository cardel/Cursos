
class Main {
	
	
  public static String recorridoPreorden(Arbol arb){
	if(arb == null){
		return "";
	}
	else{
		
		String valor = String.valueOf(arb.getValor());
		String izq = recorridoPreorden(arb.getHizq());
		String der1 = recorridoPreorden(arb.getHder1());
		String der2 = recorridoPreorden(arb.getHder2());
		
		return valor+","+izq+der1+der2;
		
	}
  }

  public static String recorridoInorden(Arbol arb){
	if(arb == null){
		return "";
	}
	else{
		
		String valor = String.valueOf(arb.getValor());
		String izq = recorridoInorden(arb.getHizq());
		String der1 = recorridoInorden(arb.getHder1());
		String der2 = recorridoInorden(arb.getHder2());
		
		return izq+valor+","+der1+der2;
		
	}
  }
  
    public static String recorridoPosorden(Arbol arb){
	if(arb == null){
		return "";
	}
	else{
		
		String valor = String.valueOf(arb.getValor());
		String izq = recorridoPosorden(arb.getHizq());
		String der1 = recorridoPosorden(arb.getHder1());
		String der2 = recorridoPosorden(arb.getHder2());
		
		return izq+der1+der2+valor+",";
		
	}
  }

  public static void main(String[] args) {
    //Crear el new Arbol
    Arbol arbolEjemplo = new Arbol(
      'a',
      new Arbol(
        'b',
        new Arbol('e', null, null,null),
        new Arbol(
            'f',new Arbol('l',null,null,null), new Arbol('m',null,null,null),null
          ),
          new Arbol('g',null,null,null)
        ),
        new Arbol(
          'c',
          new Arbol('h',null,null,null),
          new Arbol('i',null,null,null),
          null
        ),
        new Arbol(
          'd',
          new Arbol('j',new Arbol('n',null,null,null),new Arbol('o',null,null,null),null),
          new Arbol('k',new Arbol('p',null,null,null),new Arbol('q',null,null,null),null),
          null
        )

    );
    
    System.out.println("Preorden "+recorridoPreorden(arbolEjemplo));
    System.out.println("Inorden "+recorridoInorden(arbolEjemplo));
    System.out.println("Posorden "+recorridoPosorden(arbolEjemplo));

  }
  
}

