range = 5;
syms t;
%%%%%%%%
a = 2;
f=piecewise((0<=t)&(t<=a), t/a, (a<=t)&(t<=2*a), 2-(t/a));
numarator = [0, 1];
denominator = [a, 0, 0];
%%%%%%%%
xs=laplace(f)
fplot(f, [-range, range]);
zeros = roots(numarator);
poles = roots(denominator);
disp("The zeros are:-");
disp(zeros);
disp("The poles are:-");
disp(poles);
