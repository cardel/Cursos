'''
Carlos A Delgado
20-05-2022
Ejemplo pseudocodigo
'''

#n = 5
#escriba n
n = 5
print(n)

#n=8
#escriba "el valor de n es " n
n = 8
print("El valor de n es "+str(n)) #str(n) transforma n (int) a un string

n = 8
m = 4
print("Los valores de n y m son "+str(n)+" "+str(m)) #Esta manera funciona mejor en el reto 1
print("Los valores de n y m son",n,m)

#lea n
n = int(input("Ingrese un número ")) #leemos un número entero
print(n)

#lea a,b
a = int(input("Ingrese otro número "))
b = int(input("Ingrese otro número "))
#b = float(input("Ingrese otro número ")) El caso en que sea un flotante
print(a,b)

#lea nombre
nombre = input("Ingrese el nombre ") #Es un string (str)
print(nombre)

#lea var_e, var_r, var_c
#var_e int, var_r float, var_c str
var_e = int(input("Ingrese un número "))
var_r = float(input("Ingrese un numero flotante "))
var_c = input("Ingrese una cadena de texto ")
print(var_e,var_r,var_c)