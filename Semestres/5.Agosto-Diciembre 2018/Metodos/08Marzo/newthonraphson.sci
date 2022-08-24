clc()

function resultado=f(x)
    resultado = exp(-x)-x
endfunction

function resultado=df(x)
    resultado = -(exp(-x))-1
endfunction

function Tabla = newtonRaphson(xo)
    
    for i=1:1:10
        Tabla(i,1) = i
        Tabla(i,2) = xo
        Tabla(i,3) = f(xo)
        
        xo = xo - f(xo)/df(xo)
    end
    
endfunction
