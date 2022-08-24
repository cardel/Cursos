function [xrold, xrnew, ea] = puntofijo(niter)
    //****************************************//
    fid = mopen('matriz.dat', "w");
    if (fid == -1)
        error('cannot open file for writing');
    end    
    mfprintf(fid, "%s %s %s \n", 'xrold', 'xrnew', 'ea');        
    //****************************************//
    xrnew = 0, niter = 20;
    for i = 1:niter
        xrold = xrnew;
        xrnew = exp(-xrold);
        ea = abs((xrnew - xrold)/xrnew)*100        
        //****************************************//
        mfprintf(fid, "%f %f %f \n", xrold, xrnew, ea);
        //****************************************// 
    end
    //****************************************//
    mclose(fid);   
    //****************************************//
endfunction