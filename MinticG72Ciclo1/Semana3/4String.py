'''
Carlos A Delgado
01 de Junio de 2022
Ejemplos de cadenas de texto (str)
'''

cadena1 = "Hola mundo"
cadena2 = 'Hola mundo'
print(cadena1==cadena2)
print(cadena1[0]) #Primera letra
print(cadena1[1]) #Segunda letra
print(cadena1[4]) #Quinta letra espacio
print(cadena1[9]) #Decima letra 

cadena3 = "Hola"
print(cadena3[1]+cadena3[0]+cadena3[2]+cadena3[3]+cadena3[0])

print(len(cadena2))
print(cadena2[len(cadena2)-1])

print(cadena3[-1]) #Nos retorna el ultimo
print(cadena3[-2]) #Nos retorna el penultimo
print(cadena3[-1]+cadena3[0]+cadena3[-2]+cadena3[3]+cadena3[-3])
#aHllo

