def algoritmo1(n):
    i = 0
    cnt=1
    res = 0
    cnt+=1
    while i<=n:
        cnt+=1
        res = i+2
        cnt+=1
        i+=3
        cnt+=1
    cnt+=1
    return cnt

for n in [21,30,42,51,60,81]:
    print(n+6,algoritmo1(n))

def algoritmo2(n):
    i = 2*n
    cnt = 1
    res = 0
    cnt += 1
    while i>=0:
        cnt += 1
        res += i
        cnt += 1
        i-=2
        cnt += 1
    cnt += 1
    return cnt

for n in [20,40,60,80,90]:
    print(3*n+6,algoritmo2(n))

def algoritmo3(n):
    i = 2*n
    cnt = 1
    res = 0
    cnt += 1
    while i>0:
        cnt += 1
        j = 0
        cnt += 1
        while j<=2*n:
            cnt += 1
            res += 4
            cnt += 1
            j+=2
            cnt += 1
        cnt += 1
        i -= 1
        cnt += 1
    cnt += 1
    return cnt


for n in [20,40,60,80,90]:
    print(6*n**2+14*n+3,algoritmo3(n))
