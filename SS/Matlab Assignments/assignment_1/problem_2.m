t = -10:0.0001:10;
n = -10:1:10;

y1t = exp(t);
y1n = exp(n);
y2t = exp(-t);
y2n = exp(-n);

subplot(2, 2, 1);
plot(t, y1t);
xlabel("t");
ylabel("x(t)");
title("x(t) = e^t");

subplot(2, 2, 2);
plot(n, y1n);
xlabel("n");
ylabel("x(n)");
title("x(t) = e^n");

subplot(2, 2, 3);
plot(t, y2t);
xlabel("t");
ylabel("x(t)");
title("x(t) = e^-t");

subplot(2, 2, 4);
plot(n, y2n);
xlabel("n");
ylabel("x(n)");
title("x(t) = e^-n");
