t=0:0.2:1
//Reserva de memoria para y
[c] = (length(t))
c(1) = 10
diffT = 0.2
k = 0.2

for i = 1:1:length(t)-1
    c(i+1)= -k*c(i)*diffT+c(i)
end

plot(t,c,'marker','.','color','red')

ylabel("$\frac{Bq}{L}$",'fontsize',4)
xlabel("d",'fontsize',4)
title("Concentración del material en el tiempo")
legend(['Método de Euler'],[-1]);
