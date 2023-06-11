range = 5;
syms s;
%%%%%%%%
xs = (1-s*exp(-s))/(s*(s+2));
%%%%%%%%
xt = ilaplace(xs)
fplot(xt, [-range, range]);
