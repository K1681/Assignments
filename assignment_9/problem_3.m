range = 5;
syms t;
%%%%%%%%
f=heaviside(t)-2*heaviside(t-1)+heaviside(t-3);
numarator = [0, 1];
denominator = [1, 0];
%%%%%%%%
xs=laplace(f)
fplot(f, [-range, range]);
zeros = roots(numarator);
poles = roots(denominator);
disp("The zeros are:-");
disp(zeros);
disp("The poles are:-");
disp(poles);
