//************** Ejecucion metodo punto fijo **************

clear all; clc;

[xrold, xrnew, ea] = puntofijo(niter)

x = 0:0.01:2
y1 = x;
y2 = exp(-x);
y3 = y2 - y1;
plot2d(x,[y1',y2',y3']) ,[1,2 3])
xlabel('$x$',"fontsize",5)
ylabel('$f(x)$',"fontsize",5)
title('$x\ vs\ f(x)$',"fontsize",5)
e = gce();
e.children(1).line_style=2;
e.children(2).line_style=3;
e.children(3).line_style=4;
e.children(1).thickness=2;
e.children(2).thickness=2;
e.children(3).thickness=2;
hl=captions(e.children,['$f(x)=x$';'$f(x)=e^{-x}$';'$f(x)=e^{-x}-x$']);
hl.font_size = 5;
hl.legend_location = 'in_lower_left'
set(gca(),"grid",[1 1])


