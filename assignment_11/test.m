syms t;

h(t) = piecewise(t ~= 0, sinc(t), t == 0, 1);
%h(t) = sinc(t);
n = -10:1:10;

plot(n, h(n));
%plot(n, sinc(n));