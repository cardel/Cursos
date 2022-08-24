var int: x;
var int: y;
var int: C;

solve minimize C; %Costos

%Proteina
constraint  15*x+20*y>=60;
%Grasa
constraint 10*x + 5*y >= 30;
%Triviales
constraint x>=0.0;
constraint y>=0.0;
constraint C=80*x+50*y;

output["x ",show(x)," y ",show(y), " F ", show(C)];