function [xl, xu, xr, ea] = biseccion(funcion, xl, xu, niter)    
    xr = xl;
    for i = 1:niter     
        xrold = xr;
        xr = (xl + xu)/2;
        ea = abs((xr - xrold)/xr)*100;           
        fxl = funcion(xl);
        fxr = funcion(xr);               
        if (fxl*fxr < 0) then
            xu = xr;
        else
            xl = xr;
        end      
    end    
endfunction