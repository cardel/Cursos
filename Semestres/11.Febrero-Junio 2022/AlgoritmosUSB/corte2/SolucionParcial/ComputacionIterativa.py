def algoritmo(n):
    a = 0
    s = 0
    while a <= n:
        print(a,s)
        s+=2*n
        a+=1
    print(a,s)

print(algoritmo(10))
