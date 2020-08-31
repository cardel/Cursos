x=0:10000:100000
g0= 9.8
R = 6.37*10^6
v0 = 1400
diffX = 10000

//No es posible realizar 1/(1+x) siendo x un vector
v = sqrt(2*g0*R^2*(R+x)^-1+v0^2-2*g0*R)

plot(x,v,'marker','.','color','red')

v(1) = 1400

for i = 1:1:length(x)-1
    v(i+1)= -g0*R^2/(v(i)*(R+x(i))^2)*diffX + v(i)
end

plot(x,v,'marker','>','color','blue')

ylabel("$\frac{m}{s}$",'fontsize',4)
xlabel("m",'fontsize',4)
title("Velocidad vs distancia")
legend(['Método análitico';'Método de Euler'],[-1]);
