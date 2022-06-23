"""
Carlos A Delgado
22 de Junio de 2022
Ejercicio 2:

Desarrollar una función que reciba dos números a y b

Esta función va a retornar un string de esta manera

"a a+1 a+2 a+3 a+4 a+5 ... b\n
"a a+2 a+4 a+6 a+8 .... b\n
"a a+3 a+6 a+9 a+12 ... b\n
"a a+4 a+8 a+12 a+16 ... b\n

a = 0  b = 100
"
0 1 2 3 4 5 ... 100
0 2 4 6 8 10 ... 100
0 3 6 9 12 15 ... 99
0 4 8 12 16 20 ... 100
"
Hay que usar ciclo for y ciclo while
"""

def generar_numeros_for(a,b):
    salida = ""
    for i in range(a,b+1):
        salida+=f" {i} "
    salida+="\n"
    for i in range(a,b+1,2):
        salida+=f" {i} "
    salida+="\n"
    for i in range(a,b+1,3):
        salida+=f" {i} "
    salida+="\n"
    for i in range(a,b+1,4):
        salida+=f" {i} "
    salida+="\n"        
    return salida

def generar_numeros_while(a,b):
    salida=""
    i = a
    while i<=b:
        salida+=f" {i} "
        i+=1

    salida+="\n"
    
    i = a
    while i<=b:
        salida+=f" {i} "
        i+=2

    salida+="\n"
    i = a
    while i<=b:
        salida+=f" {i} "
        i+=3
    salida+="\n"
    i=a
    while i<=b:
        salida+=f" {i} "
        i+=4
    salida+="\n"       
    return salida

#Estrategia Juan David

def num(a, b):
    i = 0
    ws,xs,ys,zs = "","","",""
    x,y,z,w =0,0,0,0
    while i <= b:
        w = a + i
        ws+=" "+str(w)+" "
        if x<b:
            x = a + (2 * i)
            xs+=" "+str(x)+" "
        if y<b:
            y = a + (3 * i)
            ys+=" "+str(y)+" "
        
        if z<b:
            z = a + (4 * i)
            zs+=" "+str(z)+" "

        
        
        i+=1
    return ws+"\n"+xs+"\n"+ys+"\n"+zs 
 
#Ejercicio de Andrés

def numeroa(numero1,numero2):
    salida = ""
    if numero1<numero2:
        sum=0
        suma=numero1
        while suma<=numero2:
            salida+=f" {suma} "
            sum=sum+1
            suma=sum+numero1
 
        sum=0
        suma1=numero1
        while suma1<=numero2:
            salida+=f" {suma1} "
            sum=sum+2
            suma1=sum+numero1
 
        sum=0
        suma3=numero1
        while suma3<=numero2:
            salida+=f" {suma3} "
            sum=sum+3
            suma3=sum+numero1
 
        sum=0
        suma4=numero1
        while suma4<=numero2:
            salida+=f" {suma4} "
            sum=sum+4
            suma4=sum+numero1
 
        return salida
    else:
        return'el numero a es mayor que el b'


def solucion_gustavo(a,b):
    for i in range(a,b):
        print(i, end=", ") # prints: 0, 1, 2, 3, 4, 
    
    print("\n")
    
    i = a
    while i <=b:
        print( i, end =',')
        i = i + 2
    print(end =" ")
    
    print("\n")
    
    i = a
    while i <=b:
        print( i, end =',')
        i = i + 3
    print(end =" , ")
    print("\n")
    
    i = a
    while i <=b:
        print( i, end =',')
        i = i + 4
    print(end =" ")

#print(generar_numeros_for(0,100))
#print(generar_numeros_while(0,100))
#print(num(0,100))
print(numeroa(0,100))
solucion_gustavo(0,100)