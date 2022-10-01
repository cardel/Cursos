
class Array
  def comprehend(&block)
    return self if block.nil?
    self.collect(&block).compact
  end
end

def f(n)
  return [Math.log(n,2.0/3.0),-2.7095*Math.log(n,3)]
end



some_array = [0, 1, 2, 3, 4, 5]
lista = some_array.comprehend {|x| 3**x}

lista.each { |n|
  print(f(n))
}

puts(Math.log(4/3.0,2/3.0))
