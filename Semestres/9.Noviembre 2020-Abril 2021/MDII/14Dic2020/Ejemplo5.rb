
def recursivo(n)
  if n == 0
    return 4.0
  else
    if n== 1
      return 12.0    
    else
      return 8*recursivo(n-1)-16*recursivo(n-2)
    end
  end
end

def formula(n)
  return 4.0*(4**n)-n*(4**n)
end

20.times { |i| 
    print("n ",i," recursiva ",recursivo(i)," formula ",formula(i),"\n")
    }
