syms t;
%%%%%%%%
x(t) = sin(20.5*pi*t)+cos(10*pi*t);
F_max = 10.25;
Ts = 0.01;
range = 0.1;
%%%%%%%%

ws = 2*pi/Ts; % sampling freequency.
w_max = 2*pi*F_max; % max freequency of signal.
wc = w_max; % cutoff freequency of filter. In ideal case.
h(t) = piecewise(t ~= 0, 2*wc*sinc(wc*t)/ws, t == 0, 2*wc/ws);  % filter.

half = floor(range/Ts);
signal_length = 2*half+1;
origin = half+1;
xr = zeros(1, signal_length);

for i = -half:half
    for j = -half:half
        xr(origin+i) = xr(origin+i)+x(j*Ts)*h(i*Ts-j*Ts);
    end
end

xerr = zeros(1, signal_length);
for i = -half:half
    xerr(origin+i) = abs(xr(origin+i) - x(i*Ts));
end


subplot(4, 1, 1);
fplot(x, [-range, range]);
%axis([-range, range, -2, 2]);
xlabel("t");
ylabel("x(t)");
title("Original analog signal");
grid("on");

subplot(4, 1, 2);
stem(-range:Ts:range, x(-range:Ts:range));
%axis([-range, range, -2, 2]);
xlabel("kTs");
ylabel("xp(t)");
title("Discretized signal");
grid("on");

subplot(4, 1, 3);
plot(-range:Ts:range, xr);
%axis([-range, range, -2, 2]);
xlabel("t");
ylabel("xr(t)");
title("Reconstructed signal");
grid("on");

subplot(4, 1, 4);
plot(-range:Ts:range, xerr);
%axis([-range, range, -2, 2]);
xlabel("t");
ylabel("x_error(t)");
title("Error in the reconstructed signal");
grid("on");

