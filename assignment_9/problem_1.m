range = 5;
syms t;
%%%%%%%%
f=(1/sqrt(3))*(sin(sqrt(3)*t)+2*cos(sqrt(3)*t));
numarator = [0, 0];
denominator_1 = [1, 1-1i*sqrt(3)];
denominator_2 = [1, 1+1i*sqrt(3)];
%%%%%%%%
xs=laplace(f)
fplot(f, [-range, range]);
zeros = roots(numarator);
poles = [roots(denominator_1), roots(denominator_2)];
disp("The zeros are:-");
disp(zeros);
disp("The poles are:-");
disp(poles);