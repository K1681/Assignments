range = 5;
syms t;
%%%%%%%%
f=exp(-abs(t-1))*heaviside(t-1);
numarator = [0, 0];
denominator = [1, 1];
%%%%%%%%
xs=laplace(f)
fplot(f, [-range, range]);
zeros = roots(numarator);
poles = roots(denominator);
disp("The zeros are:-");
disp(zeros);
disp("The poles are:-");
disp(poles);
