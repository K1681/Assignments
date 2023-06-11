range = 5;
syms s;
%%%%%%%%
xs = 1/(s*((s+3)^3)*(s+2));
%%%%%%%%
xt = ilaplace(xs)
fplot(xt, [-range, range]);
