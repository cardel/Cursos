var int: x1; var int: x2; var 0.0..100000000.0: z;

solve maximize z;

constraint 2*x1+x2 <= 6; %Cuanto se gasta A
constraint x1+2*x2 <= 8; %Cuenta de gasta B
constraint z= 2*x1+3*x2;
constraint x1>=0;
constraint x2>=0;
constraint x1 <= 2;
constraint x1 - x2 <= 1;

output [" interiores ", show(x1), " exteriores ", show(x2), " ganancia ", show(z) ];