range = 5;
syms s;
%%%%%%%%
xs = ((s^2)-3)/((s+1)*(s+2));
%%%%%%%%
xt = ilaplace(xs)
fplot(xt, [-range, range]);
