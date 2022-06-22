"""
Carlos A Delgado
21 de Junio del 2022
Este es un ejemplo de un programa que utiliza la clase carro
"""
from Carro import Carro


objCarro1 = Carro("Nissan",2012,"Verde",1280) #Instanciación
objCarro2 = Carro("KIA",2022,"Verde",1500) #Instanciación
objCarro3 = Carro("Chevrolet",2020,"Azul",2000) #Instanciación

print(objCarro1.toString()) #Envio de un mensaje
print(objCarro2.toString()) #Envio de un mensaje
print(objCarro3.toString()) #Envio de un mensaje

objCarro1.cambiarColor("Rosado") #Envio de un mensaje
print(objCarro1.toString()) #Envio de un mensaje