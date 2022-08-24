import Cola
def problema_josepho(n,paso):
    cola = Cola.Cola(n)
    for i in range(1,n+1):
        cola.enqueue(i)
    
    while(cola.num_elm>1):
        cnt = 0
        while(cnt < paso):
            cola.enqueue(cola.dequeue())
            cnt+=1

        cola.dequeue() #Matamos al soldado de la posición paso

    return cola.dequeue()


print(problema_josepho(7,1))
print(problema_josepho(7,2))
print(problema_josepho(40,7))