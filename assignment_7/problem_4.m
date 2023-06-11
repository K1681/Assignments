range = 2;
scale = 0.2;
syms t;
%%%%%
a = 1.5;
xt = heaviside(-a*t);
%%%%%
k = 1;
magnitude = zeros(1, ((2*range)/scale)+1);
phase = zeros(1, ((2*range)/scale)+1);
w = zeros(1, ((2*range)/scale)+1);
for f = -range:scale:range
    xw = int(xt.*exp(-1i*2*pi*f*t), t, -inf, inf);
    magnitude(k) = abs(xw);
    phase(k) = angle(xw);
    w(k) = 2*pi*f;
    k = k + 1;
end
subplot(2, 2, 1);
fplot(xt, [-range, range]);
title("Plot");
xlabel("t");
ylabel("x(t)");
subplot(2, 2, 3);
plot(w, magnitude);
title("Magnitude");
xlabel("\omega");
ylabel("|X(\omega)|");
subplot(2, 2, 4);
plot(w, phase);
title("Phase");
xlabel("\omega");
ylabel("arg(X(\omega))");