import math
def programa1(n):
    i = 1
    cnt = 1

    k = i
    cnt+=1
    while i<=n:
        cnt+=1
        
        k = i
        cnt+=1
        while(k<=n):
            cnt+=1
            k+=2
        cnt+=1

        k = 1
        cnt+=1

        i *= 2
        cnt+=1
    return cnt


for i in range(0,10):
    n = 2**i
    formula = 6+4*math.log2(n)+n/2+1+math.log2(n)*(n/2+2)-(n-1)
    print("n "+str(n)," cnt "+str(programa1(n)),formula)