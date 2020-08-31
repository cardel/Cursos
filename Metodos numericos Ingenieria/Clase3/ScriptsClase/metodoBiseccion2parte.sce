clear()
clf()
colores = ["red","green","black","magenta","black","honeydew"]

function xr = biseccion(xl,xu,n,fx)
    for i = 0:1:n
        xr = (xl+xu)/2
        
        if(fx(xl)*fx(xr)<0)
            xu = xr
        else
            xl = xr
        end
        plot(xr ,fx(xr),"marker","p")
        xstring(xr, fx(xr),string(i+1))
        

    end
endfunction

function result = funcion(x)
    result = 2*x^2-5*x-1
endfunction

raiz = biseccion(0,10,6,funcion)


x = linspace(0,10,100)
plot(x,funcion(x),"color","blue")

curr_entity = gce(); // Handle of type "Compound"
curr_polyline = curr_entity.children; // Handle of type "Polyline"
curr_polyline.mark_size = 10; // Enjoy ;)



xgrid()
