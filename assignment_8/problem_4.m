range = 5;
scale = 0.1;
val = 10;
syms n;
%%%%%
a = 2;
xn =@(n) exp(-a*abs(n));
axw =@(n) (1/(exp(a-1i*n)-1))+(1/(1-exp(-a-1i*n)));
%%%%%
k = 1;
magnitude = zeros(1, ((2*range)/scale)+1);
my_magnitude = zeros(1, ((2*range)/scale)+1);
phase = zeros(1, ((2*range)/scale)+1);
my_phase = zeros(1, ((2*range)/scale)+1);
w = zeros(1, ((2*range)/scale)+1);
for f = -range:scale:range
    xw = 0;
    for i=-val:1:val
        xw = xw + xn(i)*exp(-1i*2*pi*f*i);
    end
    omega = 2*pi*f;
    w(k) = omega;
    magnitude(k) = abs(xw);
    my_magnitude(k) = abs(axw(omega));
    phase(k) = angle(xw);
    my_phase(k) = angle(axw(omega));
    k = k + 1;
end
subplot(3, 2, 1);
stem(-range:scale:range, arrayfun(xn, -range:scale:range));
title("Plot");
xlabel("n");
ylabel("x(n)");
subplot(3, 2, 3);
plot(w, magnitude);
title("Computed Magnitude");
xlabel("\omega");
ylabel("|X(\omega)|");
subplot(3, 2, 4);
plot(w, phase);
title("Computed Phase");
xlabel("\omega");
ylabel("arg(X(\omega))");

subplot(3, 2, 5);
plot(w, my_magnitude);
title("Analytical Magnitude");
xlabel("\omega");
ylabel("|X(\omega)|");
subplot(3, 2, 6);
plot(w, my_phase);
title("Analytical Phase");
xlabel("\omega");
ylabel("arg(X(\omega))");

function output = u(input)
if(input >= 0)
    output = 1;
else
    output = 0;
end
end