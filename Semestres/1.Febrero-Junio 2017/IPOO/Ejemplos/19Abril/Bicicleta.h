/*
 * Autor: Carlos Andres Delgado
 * Descripción: Ejemplo clase bicicleta
 * Fecha de modificación: 19 de Abril
 */
 
 #ifndef BICICLETA_H
 #define BICICLETA_H
 
 #include <string>
 using namespace std;
 
class Bicicleta{
	private:
		string color;
		string marca;
		int peso;
		int size;
		
	public:
		Bicicleta();
		~Bicicleta();
		
		string getColor();
		string getMarca();
		int getPeso();
		int getSize();
		
		void setColor(string colorIn);
		void setMarca(string marcaIn);
		void setPeso(int pesoIn);
		void setSize(int sizeIn);
};
#endif
