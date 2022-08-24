function [xrold, xr, ea] = newtonraphson(funcion, dfuncion, xr, niter)  
    for i = 1:niter
        xrold = xr
        fxr = funcion(xr)
        dfxr = dfuncion(xr)
        xr = xr - fxr/dfxr;
        ea = abs((xr - xrold)/xr)*100;        
    end
endfunction