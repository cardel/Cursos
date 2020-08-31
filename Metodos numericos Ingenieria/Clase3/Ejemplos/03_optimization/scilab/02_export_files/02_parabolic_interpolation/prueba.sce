//************** Ejecucion metodo interpolacion parabolica **************

clear all; clc;

// Solucion del problema de optimizacion
function fx = funcion(x)
    fx = (x^2)/10 - 2*sin(x);
endfunction

x1 = 0, x2 = 1, x3 = 4, niter = 5;
[x1, fx1, x2, fx2, x3, fx3, x4, fx4] = interpolacioncuadratica(funcion, x1, x2, x3, niter)

// Grafico de la solucion
x = 0:0.1:4;
fx=funcion(x)
plot(x,fx)
plot(x4,fx4,'marker','d')
xlabel('$t(independiente)$',"fontsize",5)
ylabel('$fx(dependiente)$',"fontsize",5)
title('$x\ vs\ fx$',"fontsize",5)
set(gca(),"grid",[1 1])
