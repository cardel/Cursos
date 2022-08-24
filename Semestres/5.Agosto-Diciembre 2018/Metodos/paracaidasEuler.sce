
//Autor: Docente curso métodos númericos
//Fecha: 7 de Septiembre 2018
//Ejemplo de clase con Euler
clear all
clf
function f=ecuacionParacaidas(g,m,fr,t)
    f = m*g*(1-exp(-fr*t/m))/fr
endfunction

function v=ecuacionParacaidasEuler(g,m,fr,t)
    //Condición inicial, t=0 v(0)= 0
    v(1) = 0
    for i=2:1:length(t)
        v(i) = (g-fr*v(i-1)/m)*(t(i)-t(i-1))+v(i-1)
    end
    //for i=1:1:length(t)-1
    //    v(i+1) = (g-fr*v(i)/m)*(t(i+1)-t(i))+v(i)
    //end    
    
endfunction


g = 9.8
m = 68.1
fr = 12.5

// valor-inicial:incremento:valor-final
t = 0:2:20
resultado =ecuacionParacaidas(g,m,fr,t)
resultadoEuler = ecuacionParacaidasEuler(g,m,fr,t)

t2 = 0:0.5:20
resultadoEulerT2 = ecuacionParacaidasEuler(g,m,fr,t2)

plot(t,resultado,"r-")
plot(t,resultadoEuler, "b>-")
plot(t2,resultadoEulerT2, "g*-")
xtitle("Velocidad del paracaidista con respecto al tiempo")
xlabel("Tiempo (s)")
ylabel("Velocidad (m/s)")
legend(["Ecuación Análitica","Ecuación método Euler dt=2","Ecuación método Euler dt=0.5"],-1)


