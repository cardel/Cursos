function [xrold, xr, ea] = secante(funcion, pt, xr, niter)
    //****************************************//
    fid = mopen('matriz.dat', "w");
    if (fid == -1)
        error('cannot open file for writing');
    end    
    mfprintf(fid, "%s %s %s \n", 'xrold', 'xr', 'ea');        
    //****************************************//    
    for i = 1:niter
        xrold = xr        
        fxr = funcion(xr)
        fxrpt = funcion(xr+pt*xr)        
        xr = xr - (pt*xr*fxr)/(fxrpt - fxr);
        ea = abs((xr - xrold)/xr)*100;
        //****************************************//
        mfprintf(fid, "%f %f %f \n", xrold, xr, ea);
        //****************************************// 
    end
    //****************************************//
    mclose(fid);   
    //****************************************//
endfunction