"""
Carlos A Delgado
21 de Junio de 2022
Ejemplo de clase carro
"""

class Carro:
    #Constructor
    """
    En este método definimos los atributos de la clase
    """
    def __init__(self,marca,modelo,color,cilindraje):
        self.marca = marca
        self.modelo = modelo
        self.color = color
        self.cilindraje =cilindraje

    def toString(self):
        return f"El carro tiene como marca {self.marca}, modelo {self.modelo}, color {self.color} y cilindraje {self.cilindraje}"

    def cambiarColor(self,color):
        self.color = color