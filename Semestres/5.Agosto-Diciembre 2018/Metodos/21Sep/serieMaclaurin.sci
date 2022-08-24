//Autor: Carlos Andres Delgado
//Ejemplo de serie de Maclaurin
//x^3 + 4x^2+2x +1,  x = 2
clear all

function s = f(x)
    s = x*x*x+ 4*x*x+2*x+1
endfunction

function s = f1(x)
    s = 3*x^2 + 8*x+2
endfunction

function s= f2(x)
    s = 6*x + 8
endfunction

function s = f3(x)
    s = 6
endfunction

function s = f4(x)
    s = 0
endfunction

function tabla = macclaurin(x,e)
    ep = 0.5*10^(2-e)
    ea = 100
    
    termino = 0
    n = 0
    while ea >= ep

        
       terminoanterior = termino
       
       if n == 0
           termino = terminoanterior + (f(0)*x^0)/factorial(0)
       elseif n == 1
           termino = terminoanterior + (f1(0)*x^1)/factorial(1)
       elseif n == 2
           termino = terminoanterior + (f2(0)*x^2)/factorial(2)
       elseif n == 3
           termino = terminoanterior + (f3(0)*x^3)/factorial(3)
       else
           termino = terminoanterior + (f4(0)*x^n)/factorial(n)
       end      
       tabla(n+1,1) = n
       tabla(n+1,2) = termino
       tabla(n+1,3) = ea
       if n > 0      
         ea = (termino - terminoanterior)/termino
       end
       n = n + 1
    end
    tabla(n+1,1) = n
    tabla(n+1,2) = termino
    tabla(n+1,3) = ea
    
endfunction

macclaurin(2,6)



    
    
    
    
    
    
    
    
    
    
    
    
    
    
