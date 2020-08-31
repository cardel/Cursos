gca()
t=0:1:12
g = 9.8
Cd = 0.225
m = 68.1
diffT = 1
a = sqrt(m*g/Cd)

v = a*tanh(a*Cd*t/m)

plot(t,v,'marker','.','color','red')

v(1) = 0

for i = 1:1:length(t)-1
    v(i+1) = diffT*g-Cd*v(i)^2/m + v(i)
end
plot(t,v,'marker','>','color','blue')

ylabel("$\frac{m}{s}$",'fontsize',4)
xlabel("seg",'fontsize',4)
title("Velocidad vs tiempo")
legend(['Método análitico';'Método de Euler'],[-1]);
