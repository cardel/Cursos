var int: x1; var int: x2; var int: x3; var int: x4; var int: x5;
var 0.0..1000000.0: z;

solve minimize z;
 
 
constraint z = 6*x1+10*x2+18*x3+24*x4+30*x5;
constraint x1>=0;
constraint x2>=0;
constraint x3>=0;
constraint x4>=0;
constraint x5>=0; 
constraint x1<= 300;
constraint x2 <= 400;
constraint x3<= 200;
constraint x4<= 700;
constraint x5<= 450;
constraint 0.25*(0.10*x1+0.15*x2+0.20*x3+0.30*x4+0.40*x5)+0.75*(0.90*x1+0.85*x2+0.80*x3+0.70*x4+0.60*x5) = 1000;

output ["x1  ",show(x1),
" x2  ",show(x2),
" x3  ",show(x3),
" x4  ",show(x4),
" x5  ",show(x5),
" costo: ", show(z),
" materiales: ", show(0.25*(0.10*x1+0.15*x2+0.20*x3+0.30*x4+0.40*x5)+0.75*(0.90*x1+0.85*x2+0.80*x3+0.70*x4+0.60*x5))]