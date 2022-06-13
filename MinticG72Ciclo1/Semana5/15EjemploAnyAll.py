"""
Carlos A Delgado
12 de Junio de 2022
Ejemplo de una función para un numero palindromo positivo
En este problema debemos determinar
1) Todos los números deben ser positivos
2) Existe al menos un número palindromo
"""
def determinar_numero_palindrom(lst):
    #¿Todos son positivos?
    son_positivos = all(map(lambda x: x>=0, lst))
    if son_positivos:
        existe_palindromo = any(map(lambda x: str(x)==str(x)[::-1], lst)) #Toma el número y lo transforma a str y lo compara con su invertido
        return existe_palindromo
    else:
        return False

print(determinar_numero_palindrom([1,2,3,4,5,6,7,8,9,10,11]))
print(determinar_numero_palindrom([203,302,401,113,205,206,1023]))
print(determinar_numero_palindrom([1,2,3,4,5,6,7,8,-1,2,3,4,5]))