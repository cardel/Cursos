def programa2(n):
    s = 0
    cnt = 1 # s = 0 
    i = 1
    cnt +=1 # i = 1
    while i <= n:
        cnt+=1 #Verificación i<=n valido
        t = 0
        cnt+=1 #t = 0
        j = 1
        cnt+=1 #j = 1
        while j <= i:
            cnt +=1 #j<=n para los validos
            t = t+1
            cnt +=1 # t =t+1
            j = j+1
            cnt +=1 #j = j+1
        cnt +=1 #Salida del while interno (no válido)
        s = s+t
        cnt+=1 #s=s+t
        i = i+1
        cnt+=1 #i =i+1
    cnt += 1 #Salida del while externo
    return cnt

for n in [100,500,1000,1500,2000,5000,7500,10000]:
    print(programa2(n),1.5*n**2+7.5*n+3)