function [xl, xu, xr, ea] = biseccion(funcion, xl, xu, niter)    
    //****************************************//
    fid = mopen('matriz.dat', "w");
    if (fid == -1)
        error('cannot open file for writing');
    end    
    mfprintf(fid, "%s %s %s %s %s %s %s\n", 'xl', 'xr', 'xu', 'fxl', 'fxr', 'fxu', 'ea');        
    //****************************************//
    xr = xl;
    for i = 1:niter     
        xrold = xr;
        xr = (xl + xu)/2;
        ea = abs((xr - xrold)/xr)*100;
        fxl = funcion(xl);
        fxr = funcion(xr);  
        fxu = funcion(xu); // No es necesario evaluarlo
        //****************************************//
        mfprintf(fid, "%f %f %f %f %f %f %f \n", xl, xr, xu, fxl, fxr, fxu, ea);
        //****************************************//
        if (fxl*fxr < 0) then
            xu = xr;
        else // fxr*fxu < 0 // Por esto no es necesario evaluar fxu
            xl = xr;
        end      
    end    
    //****************************************//
    mclose(fid);   
    //****************************************//
endfunction