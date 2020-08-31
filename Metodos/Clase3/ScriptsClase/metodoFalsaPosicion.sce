clear()
clf()


function xr = biseccion(xl,xu,n,fx)
    for i = 0:1:n
        xr = (xl+xu)/2
        
        if(fx(xl)*fx(xr)<0)
            xu = xr
        else
            xl = xr
        end
        plot(xr ,fx(xr),"marker","p")
        xstring(xr, fx(xr),"B"+string(i+1))
        

    end
endfunction

function xr = falsaPosicion(xl,xu,n,fx)
    for i = 0:1:n
        xr = xu - (fx(xu)*(xl-xu))/(fx(xl)-fx(xu))
        
        if(fx(xl)*fx(xr)<0)
            xu = xr
        else
            xl = xr
        end
        plot(xr ,fx(xr),"marker","p")
        xstring(xr, fx(xr),"F"+string(i+1))
        

    end
endfunction

function result = funcion(x)
    result = 2*x^2-5*x-1
endfunction

raiz = biseccion(1,10,4,funcion)
raizF = falsaPosicion(1,10,4,funcion)

x = linspace(1,10,100)
plot(x,funcion(x),"color","blue")

curr_entity = gce(); // Handle of type "Compound"
curr_polyline = curr_entity.children; // Handle of type "Polyline"
curr_polyline.mark_size = 10; // Enjoy ;)



xgrid()
