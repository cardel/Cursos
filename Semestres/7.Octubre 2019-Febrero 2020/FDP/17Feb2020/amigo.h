#ifndef AMIGO_H
#define AMIGO_H
#include <string>

using std::string;

class Amigo{
	private:
		string nombre;
		int edad;
		string color_ojos;
		string cedula;
		int num_parejas;
	
	public:
		Amigo(string nombre, int edad, string color_ojos, string cedula, int num_parejas);
		
		int getEdad();
		
		void setEdad(int edad);
		
		bool mayorEdad();
	
};



#endif

