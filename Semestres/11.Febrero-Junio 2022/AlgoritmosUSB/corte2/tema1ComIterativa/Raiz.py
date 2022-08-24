def raiz(x,error):
    i = 1 #Estado inicial
    a = 1 #Estado inicial
    while abs(a**2-x)>=error:
        a = (a+x/a)/2 #Transformación de estados
        i+=1 #Transformación de estados
    return a

print(raiz(25,0.00000001))
print(raiz(354,0.001))