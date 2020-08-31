function [xu, xl, fxl, fxu, xr, ea] = falsaposicion(funcion, xl, xu, niter)
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
        fxl = funcion(xl); 
        fxu = funcion(xu);     
        xr = xu - fxu*(xl - xu)/(fxl-fxu);
        ea = abs((xr - xrold)/xr)*100;           
        fxr = funcion(xr);    
        //****************************************//
        mfprintf(fid, "%f %f %f %f %f %f %f\n", xl, xr, xu, fxl, fxr, fxu, ea);
        //****************************************//          
        if (fxl*fxr < 0) then
           xu = xr;
        else
           xl = xr;
        end 
    end
    //****************************************//
    mclose(fid);   
    //****************************************//
endfunction