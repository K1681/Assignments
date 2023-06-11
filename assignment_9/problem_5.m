range = 5;
syms s;
%%%%%%%%
xs = (5*s-3)/((s+1)*(s+2)*(s+3));
%%%%%%%%
xt = ilaplace(xs)
fplot(xt, [-range, range]);
