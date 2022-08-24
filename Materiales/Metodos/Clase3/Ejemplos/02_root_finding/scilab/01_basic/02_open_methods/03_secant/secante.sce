function [xrold, xr, ea] = secante(funcion, pt, xr, niter)  
    for i = 1:niter
        xrold = xr        
        fxr = funcion(xr)
        fxrpt = funcion(xr+pt*xr)        
        xr = xr - (pt*xr*fxr)/(fxrpt - fxr);
        ea = abs((xr - xrold)/xr)*100; 
    end
endfunction