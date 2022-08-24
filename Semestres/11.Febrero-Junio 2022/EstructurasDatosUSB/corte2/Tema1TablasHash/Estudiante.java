public class Estudiante {
    private String name;
    private int age;
    private double average;
    private int code;

    Estudiante(String name, int age, double average, int code) {
        this.name = name;
        this.age = age;
        this.average = average;
        this.code = code;
    }

    public String toString() {
        return "El código es "+this.code+" el nombre es "+this.name+
        " la edad es "+this.age+" y el promedio es "+this.average;
    }
}
