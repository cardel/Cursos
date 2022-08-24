var int: x1; var int: x2;
var 0.0..100000000000.0: z;

solve minimize z;

constraint z = 40*x1+30*x2;
constraint 0.4*x1+0.3*x2 >= 8;
constraint 0.2*x1+0.45*x2 >= 6;
constraint 0.3*x1+0.1*x2 >= 7;
constraint 0.1*x1+0.05*x2 >= 3;
constraint x1>=0;
constraint x2>=0;

output[" Crudo ligero ", show(x1),
       " Crudo pesado ", show(x2),
       " Costo ", show(z)]