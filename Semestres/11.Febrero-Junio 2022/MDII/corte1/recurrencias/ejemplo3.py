def recurrencia(n):
    if n==1:
        return 4
    else:
        return 2*recurrencia(n/2)+n**2

def formula(n):
    return (8/3)*n+(4/3)*n**2

lista = [2**x for x in range(0,10)]
print(lista)

for n in lista:
    print(recurrencia(n),formula(n))