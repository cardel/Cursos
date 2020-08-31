
//Metodo de Newton-Raphson f(x) = e^(-x)-x

function result = f(x)
    result = exp(-x)-x
endfunction

function result = f1d(x)
    result = -exp(-x)-1
endfunction

function result = f2d(x)
    result = exp(-x)
endfunction

function tabla=newtonRaphson(x0,fx,fdx,n)
    [tabla] = (n+1)
    xr = x0
    
    tabla(1,1) = 0
    tabla(1,2) = x0
    tabla(1,3) = fx(x0)  
    tabla(1,4) = 0  
    
    for i = 1:1:n
        xa = xr
        xr = xr - fx(xr)/fdx(xr)
        tabla(i+1,1) = i
        tabla(i+1,2) = xr
        tabla(i+1,3) = fx(xr)
        
        e = 100*(xr-xa)/xr
        tabla(i+1,4) = e
    end

endfunction

tabla = newtonRaphson(0,f,f1d,4)
