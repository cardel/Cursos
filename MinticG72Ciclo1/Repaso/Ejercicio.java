public class Ejercicio {
    
    public static void main(String args[]){
        Ejercicio1 objEjercicio = new Ejercicio1();
        System.out.println(objEjercicio.determinar_edad(10));
        System.out.println(objEjercicio.determinar_edad(20));
        System.out.println(objEjercicio.determinar_edad(-10));
    }
}

class Ejercicio1{

    public String determinar_edad(int edad){
        if(edad >= 0 && edad < 10)
            return "Atracción Carros chocones";
        else if(edad >=10 && edad < 20)
            return "X-treme";
        else if(edad>=20 && edad < 30)
            return "Sillas voladoras";
        else if(edad>=30 && edad < 60)
            return "Paseo romántico";
        else if(edad>=60)
            return "Viaje relajado";
        else
            return "Edad no es correcta";
    }
}
