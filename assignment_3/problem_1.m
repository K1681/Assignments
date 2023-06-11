n = -20:1:20;
scale = 0.001;
t = -20:scale:20;


x1 = zeros(1, length(n));
index = 1;
for i = n
    x1(index) = xa(i);
    index = index + 1;
end
odd_x1 = zeros(1, length(n));
index = 1;
for i = n
    odd_x1(index) = (xa(i) - xa(-i))/2;
    index = index + 1;
end
even_x1 = zeros(1, length(n));
index = 1;
for i = n
    even_x1(index) = (xa(i) + xa(-i))/2;
    index = index + 1;
end


x2 = zeros(1, length(n));
index = 1;
for i = n
    x2(index) = xb(i);
    index = index + 1;
end
odd_x2 = zeros(1, length(n));
index = 1;
for i = n
    odd_x2(index) = (xb(i) - xb(-i))/2;
    index = index + 1;
end
even_x2 = zeros(1, length(n));
index = 1;
for i = n
    even_x2(index) = (xb(i) + xb(-i))/2;
    index = index + 1;
end


x3 = zeros(1, length(t));
index = 1;
for i = t
    x3(index) = xc(i);
    index = index + 1;
end
odd_x3 = zeros(1, length(t));
index = 1;
for i = t
    odd_x3(index) = (xc(i) - xc(-i))/2;
    index = index + 1;
end
even_x3 = zeros(1, length(t));
index = 1;
for i = t
    even_x3(index) = (xc(i) + xc(-i))/2;
    index = index + 1;
end


subplot(3, 3, 1);
stem(n, x1);
xlabel("n");
ylabel("x1(n)");
title("x1(n) = {1, 0, 2, 3, 4, 5, 6}", "Origin = 2");
subplot(3, 3, 2);
stem(n, odd_x1);
xlabel("n");
ylabel("(x1(n) - x1(-n))/2");
title("Odd component of x1(n)");
subplot(3, 3, 3);
stem(n, even_x1);
xlabel("n");
ylabel("(x1(n) + x1(-n))/2");
title("Even component of x1(n)");



subplot(3, 3, 4);
stem(n, x2);
xlabel("n");
ylabel("x2(n)");
title("x2(n) = e^0.1n * u(n) + |cos(0.2*pi*n + pi/4)|");
subplot(3, 3, 5);
stem(n, odd_x2);
xlabel("n");
ylabel("(x2(n) - x2(-n))/2");
title("Odd component of x2(n)");
subplot(3, 3, 6);
stem(n, even_x1);
xlabel("n");
ylabel("(x2(n) + x2(-n))/2");
title("Even component of x2(n)");



subplot(3, 3, 7);
plot(t, x3);
xlabel("n");
ylabel("x3(n)");
title("x2(n) = e^-at * u(t-1) + U(-t-1)", "a > 0");
subplot(3, 3, 8);
plot(t, odd_x3);
xlabel("n");
ylabel("(x3(n) - x3(-n))/2");
title("Odd component of x3(n)");
subplot(3, 3, 9);
plot(t, even_x3);
xlabel("n");
ylabel("(x3(n) + x3(-n))/2");
title("Even component of x3(n)");
fprintf("The energy of x3(t) is %f\n", sum((x3.^2).*scale));


function output = xa(input)

range = [1, 0, 1, 2, 3, 4, 5, 6];
origin = 2;
domain = (1-origin):1:(length(range)-origin);
data = dictionary(domain, range);
if ismember(input, domain)
    output = data(input);
else
output = 0;
end
end

function output = xb(input)
output = exp(input/10)*u(input) + abs(cos((pi*input)/5 + pi/4));
end

function output = xc(input)
a = 2;
output = exp(-a*input)*u(input - 1) + u(-input-1);
end

function output = u(input)
if input >= 0
    output = 1;
else
output = 0;
end
end
