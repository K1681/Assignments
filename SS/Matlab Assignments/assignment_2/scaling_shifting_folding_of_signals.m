% x(n) = {2 ,3, -3, _1, -5, 4, 7}
% x1(n) = 2x(n-3)
% x2(n) = 2x(-n)
% x3(n) = x(3n)
% x4(n) = 4x(4+2n)
% x5(n) = 2exp(n/2)x(n)
% x6(n) = x(-n +2)
% x7(n) = z(-n) where z(n) = 1, n = -2, -3
%                            -1, n = 4, 5

n = -100:1:100;
x1 = zeros(1, length(n));
x2 = zeros(1, length(n));
x3 = zeros(1, length(n));
x4 = zeros(1, length(n));
x5 = zeros(1, length(n));
x6 = zeros(1, length(n));
x7 = zeros(1, length(n));

index = 1;
for i = n
    x1(index) = 2*x(i-3);
    index = index + 1;
end
 
index = 1;
for i = n
    x2(index) = 2*x(-i);
    index = index + 1;
end
 
index = 1;
for i = n
    x3(index) = x(3*i);
    index = index + 1;
end
 
index = 1;
for i = n
    x4(index) = 4*x(2*n + 4);
    index = index + 1;
end
 
index = 1;
for i = n
    x5(index) = 2*exp(i/2)*x(i);
    index = index + 1;
end
 
index = 1;
for i = n
    x6(index) = x(2 - i);
    index = index + 1;
end
 
index = 1;
for i = n
    x7(index) = z(-i);
    index = index + 1;
end

subplot(7, 1, 1);
stem(n, x1);
xlabel("n");
ylabel("x1(n)");
title("A x1(n) = 2x(n-3)");
 
subplot(7, 1, 2);
stem(n, x2);
xlabel("n");
ylabel("x2(n)");
title("B x2(n) = 2x(-n)");
 
subplot(7, 1, 3);
stem(n, x3);
xlabel("n");
ylabel("x3(n)");
title("C x3(n) = x(3n)");
 
subplot(7, 1, 4);
stem(n, x4);
xlabel("n");
ylabel("x4(n)");
title("D x4(n) = 4x(4+2n)");
 
subplot(7, 1, 5);
stem(n, x5);
xlabel("n");
ylabel("x5(n)");
title("E x5(n) = 2exp(n/2)x(n)");
 
subplot(7, 1, 6);
stem(n, x6);
xlabel("n");
ylabel("x6(n)");
title("F x6(n) = x(-n +2)");
 
subplot(7, 1, 7);
stem(n, x7);
xlabel("n");
ylabel("x7(n)");
title("G x7(n) = z(-n)");

function output = x(input)
data_points = [2, 3, -3, 1, -5, 4, 7];
data_locations = [-3, -2, -1, 0, 1, 2, 3];
data = dictionary(data_locations, data_points);
if ismember(input, data_locations)
    output = data(input);
else
output = 0;
end
end

function output = z(input)
data_locations_1 = [-2, -3];
data_locations_2 = [4, 5];
outputs = [1, -1];
if ismember(input, data_locations_1)
    output = outputs(1);
elseif ismember(input, data_locations_2)
    output = outputs(2);
else
    output = 0;
end
end
