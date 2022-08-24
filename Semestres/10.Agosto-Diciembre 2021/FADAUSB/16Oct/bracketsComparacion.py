import Pila

def verificar_apertura(sim):
    return sim=="{" or sim == "[" or sim == "<" or sim == "("

def verificar_cerradura(apertura, cerradura):
    return apertura == "{" and cerradura == "}" or  apertura == "[" and cerradura == "]" or apertura == "<" and cerradura ==">" or apertura == "(" and cerradura ==")"

def verificarCierres(cadena):
    pila = Pila.Pila(len(cadena))
    if(len(cadena)%2==0):
        
        for i in range(len(cadena)):
            #Apilamos solo apertura:
            if verificar_apertura(cadena[i]):
                pila.push(cadena[i])
            else:
                if not(verificar_cerradura(pila.pop(),cadena[i])):
                    return "incorrecto"           

        return "correcto"
    else:
        return "incorrecto"

cadenaBuena = "{[([{[]}])]}"
cadenaMala = "{[([{[])])]}"

print(verificarCierres(cadenaBuena))
print(verificarCierres(cadenaMala))
print(verificarCierres("{([([{<{([{([{[[<{()}>]]}])}])}>}])])}"))
print(verificarCierres("{([([{<{([{([{[[<{()}>]]}))}])}>}])])}"))
print(verificarCierres("{(<>[([{<{([{([{[[][<{<>()}>]]}])}])}>}()])])}"))