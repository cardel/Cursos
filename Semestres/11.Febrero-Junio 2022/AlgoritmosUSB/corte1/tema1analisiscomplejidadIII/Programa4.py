def programa4(n):
    i = 1
    cnt = 1 # i = 1
    while i<=n:
        cnt += 1 #i<=n
        k = i
        cnt += 1 #k= i
        while k<=n:
            cnt+=1 #k<=n validos
            k+=2
            cnt+=1 #k+=2
        cnt+=1 #salida k<=n
        k = 1 
        cnt += 1 #k = 1
        while k<=i:
            cnt +=1 #k<=i validos
            k +=1
            cnt +=1 #k+=1
        cnt+=1 #salida k<=i
        i+=2
        cnt +=1 #i+=2
    cnt += 1 #salida i<=n
    return cnt

for n in [101,201,301,501,601,701,1001]:
    m = (n-1)/2
    b = m*(m+1)+2*(m+1)
    c = m*(m+1)/2
    d = m**2-(m-1)*m/2+m
    e = m+1+m*(m+1)
    f = 2*(m+1)+m*(m+1)
    print(programa4(n),m+3+3*(m+1)+b-c+d+1+e+f)