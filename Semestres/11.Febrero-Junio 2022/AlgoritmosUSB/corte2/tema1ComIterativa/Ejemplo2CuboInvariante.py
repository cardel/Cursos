def invariante(i):
    salida = 0
    for k in range(0,i):
        salida+=k**3
    return salida

def computa3(n):
    A = 0
    i = 1 
    print("i","A","Invariante","Cerrada")
    print(i,A,invariante(i),(i-1)**2*(i)**2/4)
    while i<=n:
        A = A+i**3
        i+=1        
        print(i,A,invariante(i),(i-1)**2*(i)**2/4)    
    return A

print(computa3(50))