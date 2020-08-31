//************** Ejecucion metodo newton raphson **************

clear all; clc;

function fx = funcion(x)
    v = 36, t = 4, cd = 0.25, g = 9.81;
    fx = sqrt(g*x/cd).*tanh(sqrt(g*cd./x)*t) - v;
endfunction

function dfx = dfuncion(x)
    v = 36, t = 4, cd = 0.25, g = 9.81;
    dfx = (1/2)*sqrt(g/(x*cd))*tanh(sqrt((g*cd)/(x))*t) - (g/(2*x))*t*(sech(sqrt((g*cd)/(x))*t))^2;       
endfunction

xr = 140, niter = 21;
[xrold, xr, ea] = newtonraphson(funcion, dfuncion, xr, niter) 

// Haga click sobre el valor de xr en la tabla que muestra browsevar
browsevar
