//************** Ejecucion metodo biseccion **************
clear all; clc;

function fx = funcion(x)
    v = 36, t = 4, cd = 0.25, g = 9.81;
    fx = sqrt(g*x/cd).*tanh(sqrt(g*cd./x)*t) - v;
endfunction

xl = 40, xu = 200, niter = 21;
[xl, xu, xr, ea] = biseccion(funcion, xl, xu, niter)

// Haga click sobre el valor de xr en la tabla que muestra browsevar
browsevar
