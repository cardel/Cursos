import Pila
import Cola

def verificar_palindromo(cadena):
    cola = Cola.Cola(len(cadena))
    pila = Pila.Pila(len(cadena))

    for i in range(len(cadena)):
        cola.enqueue(cadena[i])
        pila.push(cadena[i])

    for i in range(len(cadena)):
        if(cola.dequeue() != pila.pop()):
            return False
        
    return True

print(verificar_palindromo("AMOOMA"))
print(verificar_palindromo("AMAANA"))