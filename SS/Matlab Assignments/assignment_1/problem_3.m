t = -10:0.0001:10;
n = -10:1:10;
a = 2;
F = (10*pi)/3;
f = 5*pi;

y1t = a*cos(2*pi*F*t - pi/6);
y1n = a*cos(2*pi*F*n - pi/6);
y2t = a*sin(2*pi*f*t - (65*pi)/180);
y2n = a*sin(2*pi*f*n - (65*pi)/180);

subplot(2, 2, 1);
plot(t, y1t);
xlabel("t");
ylabel("x(t)");
title("x(t) = a*cos(2*pi*F*t - pi/6)");
axis([-0.3 0.3 -3 3]);
grid on;

subplot(2, 2, 2);
stem(n, y1n);
xlabel("n");
ylabel("x(n)");
title("x(t) = a*cos(2*pi*F*n - pi/6)");
grid on;

subplot(2, 2, 3);
plot(t, y2t);
xlabel("t");
ylabel("x(t)");
title("x(t) = a*sin(2*pi*f*t - (65*pi)/180)");
axis([-0.3 0.3 -3 3]);
grid on;

subplot(2, 2, 4);
stem(n, y2n);
xlabel("n");
ylabel("x(n)");
title("x(t) = a*sin(2*pi*f*n - (65*pi)/180)");
grid on;
