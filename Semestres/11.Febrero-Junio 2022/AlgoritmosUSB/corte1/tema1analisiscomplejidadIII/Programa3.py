from re import I


def programa3(n):
    i = 1
    cnt = 1
    while i<=n:
        cnt +=1 #Cuento los validos i<=n
        k = i
        cnt +=1 #k=i
        while k<=n:
            #cuento los validos k<=n
            cnt +=1
            k+=1
            cnt +=1 #Cuento k+=1
        cnt+=1 #Cuento salida k<=n
        k = 1
        cnt +=1 #Cuento k = 1
        while k<=i:
            cnt+=1 #Cuento k<=i validos
            k+=1
            cnt +=1#Cuento k+=1
        cnt+=1 #Cuento salida k<=i
        i = i+1
        cnt+=1 #Cuento i=i+1
    cnt+=1 #Cuento i<=n salida
    return cnt

for n in [100,200,500,700,1000]:
    print(programa3(n),4*n+2+n*(n+3)/2+n*(n+1)/2+n*(n+1)+n)