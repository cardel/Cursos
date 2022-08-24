clear all
clc()
clf()

function result=eqd(y,t)
    result = 2*t-2*y
endfunction

function result = solucionAnalitica(t)
    result = exp(-2*t)*(t*exp(2*t)-0.5*exp(2*t)+7/2)
endfunction

function result = metodoHeunOrden1(h,y0,t0,tf,f)
    
    tiempo = t0:h:tf
    
    result = (length(tiempo))
    result(1)=y0
   
    for i=2:1:length(tiempo)
        ya = result(i-1)
        
        //Calcular el predictor
        yap = f(ya,tiempo(i-1))
        yipredecido = ya + yap*h
        
        //Calculo la pendiente en el punto predecido
        pendienteyip = f(yipredecido,tiempo(i))
        
        //Calculo el promedio de las pendientes
        promedio = (yap+pendienteyip)*h/2
        y1i = ya + promedio
                
        result(i) = y1i

    end
    
endfunction


function result = metodoHeunOrden2(h,y0,t0,tf,f)
    
    tiempo = t0:h:tf
    
    result = (length(tiempo))
    result(1)=y0
   
    for i=2:1:length(tiempo)
        ya = result(i-1)
        
        //Calcular el predictor
        yap = f(ya,tiempo(i-1))
        yipredecido = ya + yap*h
        
        //Calculo la pendiente en el punto predecido
        pendienteyip = f(yipredecido,tiempo(i))
        
        //Calculo el promedio de las pendientes
        promedio = (yap+pendienteyip)*h/2
        y1i = ya + promedio
        
        y2i = ya + (yap+f(y1i,tiempo(i)))*h/2
        
        result(i) = y2i

    end
    
endfunction

function result = metodoHeunOrden3(h,y0,t0,tf,f)
    
    tiempo = t0:h:tf
    
    result = (length(tiempo))
    result(1)=y0
   
    for i=2:1:length(tiempo)
        ya = result(i-1)
        
        //Calcular el predictor
        yap = f(ya,tiempo(i-1))
        yipredecido = ya + yap*h
        
        //Calculo la pendiente en el punto predecido
        pendienteyip = f(yipredecido,tiempo(i))
        
        //Calculo el promedio de las pendientes
        promedio = (yap+pendienteyip)*h/2
        y1i = ya + promedio
        
        y2i = ya + (yap+f(y1i,tiempo(i)))*h/2
        
        y3i = ya + (yap+f(y2i,tiempo(i)))*h/2
        
        result(i) = y3i

    end
    
endfunction

function result = metodoHeunOrden4(h,y0,t0,tf,f)
    
    tiempo = t0:h:tf
    
    result = (length(tiempo))
    result(1)=y0
   
    for i=2:1:length(tiempo)
        ya = result(i-1)
        
        //Calcular el predictor
        yap = f(ya,tiempo(i-1))
        yipredecido = ya + yap*h
        
        //Calculo la pendiente en el punto predecido
        pendienteyip = f(yipredecido,tiempo(i))
        
        //Calculo el promedio de las pendientes
        promedio = (yap+pendienteyip)*h/2
        y1i = ya + promedio
        
        y2i = ya + (yap+f(y1i,tiempo(i)))*h/2
        
        y3i = ya + (yap+f(y2i,tiempo(i)))*h/2
        
        y4i = ya + (yap+f(y3i,tiempo(i)))*h/2
        
        result(i) = y4i

    end
    
endfunction

h = 0.1
t0 = 0
tf = 10
y0 = 3

tiempo = t0:h:tf

resultAnalitico = (length(tiempo))

for i = 1:1:length(tiempo)
    resultAnalitico(i) = solucionAnalitica(tiempo(i))
end

resultadoMetodoOrden1 = metodoHeunOrden1(h,y0,t0,tf,eqd)
resultadoMetodoOrden2 = metodoHeunOrden2(h,y0,t0,tf,eqd)
resultadoMetodoOrden3 = metodoHeunOrden3(h,y0,t0,tf,eqd)
resultadoMetodoOrden4 = metodoHeunOrden4(h,y0,t0,tf,eqd)

plot(tiempo,resultAnalitico,"color","red")
plot(tiempo,resultadoMetodoOrden1,"color","blue")
plot(tiempo,resultadoMetodoOrden2,"color","green")
plot(tiempo,resultadoMetodoOrden3,"color","black")
plot(tiempo,resultadoMetodoOrden4,"color","cyan")

legend(["Método analitico";"Método Heun orden 1";"Método Heun orden 2";"Método de Heun orden 3";"Método de Heun orden 4"],[-1])


