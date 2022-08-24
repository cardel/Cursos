clc()
clear all
clf()

function result = solucionAnalitica(t)
    result = (4/1.3)*(exp(0.8*t)-exp(-0.5*t))+2*exp(-0.5*t)
endfunction

function result= eqdiff(y,t)
    result = 4*exp(0.8*t)-0.5*y
endfunction

function [result,points]=metodoHeun(stepsize,y0, t0, tf, eqf)
    points = t0:stepsize:tf

    result = (length(points))
    
    result(1) = y0
    
    for i=2:1:length(points)
       
       //Calculos en (t0,y0)
       ya=result(i-1)
       //Pendiente en el punto
       y0p = eqf(ya,points(i-1))
       disp(y0p)
       //Calculamos el predictor
       predictor = ya + y0p
       
       //Con el predictor calculamos la pediente
       pendiente = eqf(predictor,points(i))
       
       //Con las pendientes obtenemos un promedio y se aplica el corrector
       promedioPendientes = (y0p + pendiente)/2
        result(i) = ya + promedioPendientes
    end
endfunction

function [result,points]=metodoHeunDosIteraciones(stepsize,y0, t0, tf, eqf)
    points = t0:stepsize:tf

    result = (length(points))
    
    result(1) = y0
    
    for i=2:1:length(points)
       
       //Calculos en (t0,y0)
       ya=result(i-1)
       //Pendiente en el punto
       y0p = eqf(ya,points(i-1))
       disp(y0p)
       //Calculamos el predictor
       predictor = ya + y0p
       
       //Con el predictor calculamos la pediente
       pendiente = eqf(predictor,points(i))
       
       //Con las pendientes obtenemos un promedio y se aplica el corrector
       promedioPendientes = (y0p + pendiente)/2
       
       promedioPendientes2it = ya + (y0p+  eqf(promedioPendientes,points(i)))*stepsize/2
       
        result(i) = promedioPendientes2it
    end
endfunction



function [result,points]=metodoHeunTresIteraciones(stepsize,y0, t0, tf, eqf)
    points = t0:stepsize:tf

    result = (length(points))
    
    result(1) = y0
    
    for i=2:1:length(points)
       
       //Calculos en (t0,y0)
       ya=result(i-1)
       //Pendiente en el punto
       y0p = eqf(ya,points(i-1))
       disp(y0p)
       //Calculamos el predictor
       predictor = ya + y0p
       
       //Con el predictor calculamos la pediente
       pendiente = eqf(predictor,points(i))
       
       //Con las pendientes obtenemos un promedio y se aplica el corrector
       promedioPendientes = (y0p + pendiente)/2
       
       promedioPendientes2it = ya + (y0p + eqf(promedioPendientes,points(i)))*stepsize/2
       
       promedioPendientes3it = ya + (y0p + eqf(promedioPendientes2it,points(i)))*stepsize/2
       
        result(i) = promedioPendientes3it
    end
endfunction

stepsize = 1
[results, points] = metodoHeun(stepsize,2,0,10,eqdiff)
[results2it, points2t] = metodoHeunDosIteraciones(stepsize,2,0,10,eqdiff)
[results3it, points3t] = metodoHeunTresIteraciones(stepsize,2,0,10,eqdiff)
solAnalitica = (length(points))
for i=1:1:length(points)
    solAnalitica(i) = solucionAnalitica(points(i))
end

plot(points,solAnalitica,"color","blue","marker","-")
plot(points,results,"color","red","marker",".")
plot(points,results2it,"color","green","marker","<")
plot(points,results3it,"color","cyan","marker",">")
legend(['Método analitico';'Método de Heun';'Método de Heun 2 it';'Método de Heun 3 it'],[-1])
xgrid()

