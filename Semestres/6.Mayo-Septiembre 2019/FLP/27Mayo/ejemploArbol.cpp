
class Arbol{
	
	private:
		Arbol * hizq;
		Arbol * hder;
	
	public:
	Arbol(Arbol * hizq, Arbol * hder){
		
		this->hizq = hizq;
		this->hder = hder;
	}

	~Arbol(){
		
		delete hizq;
		delete hder;
	}	
};



main(){
	
	Arbol objArbol(Arbol(Arbol(),Arbol()),Arbol());
}
