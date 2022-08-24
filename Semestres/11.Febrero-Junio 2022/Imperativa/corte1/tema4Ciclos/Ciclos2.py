
def promedio_ponderado_for(n):
    sum_notaxcredito = 0
    sum_creditos = 0
    for i in range(0,n):
        nota = float(input(f"Ingrese la nota de la materia {i+1} "))
        creditos = int(input(f"Ingrese los creditos de la materia {i+1} "))

        sum_notaxcredito += nota*creditos
        sum_creditos += creditos 
    
    return sum_notaxcredito/sum_creditos

def promedio_ponderado_while(n):
    sum_notaxcredito = 0
    sum_creditos = 0
    i=0
    while i<n:
        nota = float(input(f"Ingrese la nota de la materia {i+1} "))
        creditos = int(input(f"Ingrese los creditos de la materia {i+1} "))

        sum_notaxcredito += nota*creditos
        sum_creditos += creditos 
        i = i+1
    return sum_notaxcredito/sum_creditos

n = int(input("Ingrese el número de materias"))
print("*****Ciclo For********")
print(promedio_ponderado_for(n))
print("********Ciclo While******")
print(promedio_ponderado_while(n))