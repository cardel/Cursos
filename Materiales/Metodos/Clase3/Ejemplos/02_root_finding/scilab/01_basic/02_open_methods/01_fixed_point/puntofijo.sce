function [xrold, xrnew, ea] = puntofijo(niter)
    xrnew = 0, niter = 20;
    for i = 1:niter
        xrold = xrnew;
        xrnew = exp(-xrold);
        ea = abs((xrnew - xrold)/xrnew)*100        
    end
endfunction