

def algoritmo(n)
  j = 0
  p = 4
  print([j,p],"\n")
  while(j <= 2*n)
    p+=2
    j+=1
    print([j,p],"\n")
  end 
end


def algoritmo2(n)
  i = 0
  s = 3
  print([i,s,i*(8*n+12)/2+3],"\n")
  while(i<=n)
    j = 0
    p = 4
    while(j <= 2*n)
      p+=2
      j+=1
    end
    s += 2*p
    i += 2
    print([i,s,i*(8*n+12)/2+3],"\n")
  end 
end

algoritmo2(10)

