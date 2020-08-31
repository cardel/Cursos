// ************** Ejecucion metodo golden **************

clear all; clc;

// Solucion del problema de optimizacion
function fx = funcion(x)
    g=9.81, v0=55, m=80, c=15, z0=100;
    fx = -(z0 + (m/c)*(v0+(m*g/c))*(1-exp(-(c/m)*x))-(m*g/c)*x)
endfunction

xlow = 0, xup = 4, niter = 20;
[xlow, x2, fx2, x1, fx1, xup, d, xopt, ea] = golden(funcion, xlow, xup, niter)

// Grafico de la solucion
t = 0:0.1:10;
z = -funcion(t)
plot(t,z)
plot(xopt,-funcion(xopt),'marker','d')
xlabel('$t(tiempo)$',"fontsize",5)
ylabel('$z(elevación)$',"fontsize",5)
title('$t\ vs\ z$',"fontsize",5)
set(gca(),"grid",[1 1])
