
def fac(n,res=1):
    if n==1:
        return res
    else:
        return fac(n-1,n*res)

print(fac(5))