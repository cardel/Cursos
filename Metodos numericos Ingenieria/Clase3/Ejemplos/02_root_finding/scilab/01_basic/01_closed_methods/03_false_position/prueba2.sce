// ************** Ejecucion metodo falsa posicion (2) **************

clear all; clc;

function fx = funcion(x)
    fx = x^10 - 1;
endfunction

xl = 0, xu = 1.3, niter = 5;
[xu, xl, fxl, fxu, xr, ea] = falsaposicion(funcion, xl, xu, niter)

// Haga click sobre el valor de xr en la tabla que muestra browsevar
browsevar
