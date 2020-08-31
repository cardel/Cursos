t = 0:0.5:10
A = 1200
Q = 500
diffT = 0.5
//Reserva de memoria para y
[y] = (length(t))
y(1) = 0

for i = 1:1:length(t)-1
    y(i+1)= 3*(Q/A)*(sin(t(i))^2-Q/A)*(diffT)+y(i)
end

plot(t,y,'marker','.','color','red')

ylabel("$\frac{m}{d}$",'fontsize',4)
xlabel("d",'fontsize',4)
title("Varación del flujo en el tiempo")
legend(['Método de Euler'],[-1]);
