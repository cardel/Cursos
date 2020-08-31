//************** Ejecucion metodo secante **************

clear all; clc;

function fx = funcion(x)
    v = 36, t = 4, cd = 0.25, g = 9.81;
    fx = sqrt(g*x/cd).*tanh(sqrt(g*cd./x)*t) - v;
endfunction

niter = 6, pt = 1E-6, xr = 50;
[xrold, xr, ea] = secante(funcion, pt, xr, niter)

// Haga click sobre el valor de xr en la tabla que muestra browsevar
browsevar
