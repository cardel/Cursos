// Maclaurin Serie for exponential estimation
// inputs:
// x: value for evaluation
// iter: number of iterations
// outputs:
// aprox: aproximation of exponencial of value x
// ea: aproximate error
function [aprox,ea] = exponentialEstimation(x,iter)
  aprox = 0
  for i=1:iter
    aprox_ant = aprox
    aprox = aprox + (x^(i-1)/factorial(i-1))
    ea = ((aprox - aprox_ant)/(aprox))*100
  end
endfunction
