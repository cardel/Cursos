function [xu, xl, fxl, fxu, xr, ea] = falsaposicion(funcion, xl, xu, niter)
    xr = xl;
    for i = 1:niter   
        xrold = xr;
        fxl = funcion(xl); 
        fxu = funcion(xu);     
        xr = xu - fxu*(xl - xu)/(fxl-fxu);
        ea = abs((xr - xrold)/xr)*100;           
        fxr = funcion(xr);            
        if (fxl*fxr < 0) then
           xu = xr;
        else
           xl = xr;
        end 
    end
endfunction