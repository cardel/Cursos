package Ejemplo4

import "fmt"
import "math"

func recursivo(n int) float64{

  if n == 0{
    return 4.0
  }else{
    if n == 1{
      return 8.0
    }else{
      return 7.0*recursivo(n-1)+3.0*recursivo(n-2)
    }
  }
}

func formula(n int) float64{
  var A float64 = -6.0/math.Sqrt(61.0)+2.0
  var B float64 = 6.0/math.Sqrt(61.0)+2.0
  var r1 float64 =math.Pow((7.0+math.Sqrt(61.0))/2.0,float64(n))
  var r2 float64 =math.Pow( (7.0-math.Sqrt(61.0))/2.0,float64(n))

  return A*r1+B*r2

}

func main() {
  for i := 0; i<20; i++{
    fmt.Println("n ",i," recursivo ",recursivo(i)," formula ",formula(i))
  }
  
}
