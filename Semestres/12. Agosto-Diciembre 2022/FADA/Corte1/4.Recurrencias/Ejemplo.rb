"""
Carlos A Delgado
29 de Sep de 2022
T(n) = 4T(n/3)+n+1
"""
class Array
  def comprehend(&block)
    return self if block.nil?
    self.collect(&block).compact
  end
end


def T(n)
  if(n==1)
    return 1
  else
    return 4*T(n/3)+n+1
  end
end

def fml(n)
  return n**(Math.log(4,3))+3*n*(n**(Math.log(4/3,3)))-3*n+(n**(Math.log(4,3))-1)/3
end

some_array = [0, 1, 2, 3, 4, 5]
lista = some_array.comprehend {|x| 3**x}



lista.each { |n|
  puts(T(n))
}

    