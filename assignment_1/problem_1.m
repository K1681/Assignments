t = -2:0.00001:2;
x = zeros(1, length(t));
K = input("Enter value of K: ");
for k = -1:K
    x = x + (1 - exp(k)) * cos(2*pi*k*t);
end
plot(t, x);
xlabel("t");
ylabel("x(t)");
%sub_title = ;
title("x(t) = sum(1-e^k)cos(2*pi*k*t)", sprintf("k = -1 to %d", K));
axis([-5 5 -10 10]);
grid on;
