
def formula(n)
  return (1271.0/64.0)-(631.0/64.0)*(5**n)-(1.0/8.0)*(n**2)-(7.0/16.0)*n+10*n*(5**n)
end

def recurrencia(n)
  if n == 0
    return 10
  elsif n == 1
    return 20
  else
    return 6*recurrencia(n-1)-5*recurrencia(n-2)+n+8*(5**n)
  end
end

20.times{
    |i|
    print("Valor n ",i," Recurrencia: ", recurrencia(i)," Formula: ", formula(i),"\n")
}
