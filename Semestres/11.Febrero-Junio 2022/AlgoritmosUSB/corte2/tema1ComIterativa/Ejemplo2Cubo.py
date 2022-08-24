def computa3(n):
    A = 0
    i = 1 
    operacion = "0"
    print(i,A,operacion)
    while i<=n:
        
        A = A+i**3
        operacion+=f"+{i}^3"
        i+=1        
        print(i,A,operacion)
    
    return A

print(computa3(5))