"""
Carlos A Delgado
21 de Junio de 2022
Clase empleado
"""

class Empleado:
    def __init__(self):
        self.nombre = input("Ingrese el nombre ")
        self.sueldo = float(input("Ingrese el sueldo "))

    def imprimirDatos(self):
        print(f"El empleado {self.nombre} tiene un salario {self.sueldo}")

    
    def determinar_impuestos(self):
        if self.sueldo > 3000:
            print(f"El empleado {self.nombre} debe pagar impuestos")
        else:
            print(f"El empleado {self.nombre} NO debe pagar impuestos ")