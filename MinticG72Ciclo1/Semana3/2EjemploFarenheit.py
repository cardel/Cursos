"""
Carlos A Delgado
01-junio-2022
Programa para convertir grado farenheit a celcius
"""
def convertir_farenheit_celcius(temp_fahr):
    """
    Esta función recibe una temperatura en grados farenheit y la retorna en grados celcuis
    temp: float (temperatura en grados farenheit)
    retorno: float (temperatura celcius)
    """
    cel = (temp_fahr-32)*5.0/9.0
    return round(cel,2)

try:
    temp = float(input("Ingrese la temperatura en grados farenheit "))
    celu = convertir_farenheit_celcius(temp)
    print("El valor de la tempratura en grados farenheit "+str(temp)+" en celcius es "+str(celu))
except:
    print("Debe ingrese un valor numérico ")
