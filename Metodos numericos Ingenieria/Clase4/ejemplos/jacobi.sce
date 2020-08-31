clc()
clear all
x1 = 0
x2 = 0
x3 = 0
disp("Jacobi")
for i=2:1:4
    disp("iteración "+string(i-1))
    xa1= x1
    xa2 = x2
    xa3 = x3
    x1 = (588.6+100*xa2)/150
    x2 = (686.7+100*xa1+50*xa3)/150
    x3 = (784.8 + 50*xa2)/50
    disp("variables")
    disp([x1,x2,x3])
    disp("errores aproximados")
    disp(100*(x1-xa1)/x1)
    disp(100*(x2-xa2)/x2)
    disp(100*(x3-xa3)/x3)
end
