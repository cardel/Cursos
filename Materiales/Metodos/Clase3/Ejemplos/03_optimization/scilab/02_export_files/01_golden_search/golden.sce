function [xlow, x2, fx2, x1, fx1, xup, d, xopt, ea] = golden(funcion, xlow, xup, niter)
    //****************************************//
    fid = mopen('matriz.dat', "w");
    if (fid == -1)
    error('cannot open file for writing');
    end
    mfprintf(fid, "%s %s %s %s %s %s %s %s %s \n", 'xlow', 'x2', 'fx2', 'x1', 'fx1', 'xup', 'd', 'xopt', 'ea');
    //****************************************//    
    phi = (1 + sqrt(5))/2;
    for i=1:niter
        d = (xup - xlow)/phi;
        x1 = xlow + d;
        x2 = xup - d;    
        fx1 = funcion(x1);
        fx2 = funcion(x2);
        //****************************************//      
        mfprintf(fid, "%f %f %f %f %f %f %f ", xlow, x2, fx2, x1, fx1, xup, d);
        //****************************************//      
        if (fx1 < fx2) then
            xopt = x1;
            xlow = x2;  
        else
            xopt = x2;
            xup = x1;
        end
        ea = (2-phi)*abs((xup-xlow)/xopt)*100
        mfprintf(fid, "%f %f \n", xopt, ea);
    end
    //****************************************//
    mclose(fid);
    //****************************************//
endfunction