n = -100:1:100;
original = zeros(1, length(n));
folding = zeros(1, length(n));
shifting = zeros(1, length(n));

index = 1;
for i = n
    original(index) = x(i);
    index = index + 1;
end

index = 1;
for i = n
    folding(index) = x(-i);
    index = index + 1;
end

index = 1;
for i = n
    shifting(index) = x(2-i);
    index = index + 1;
end

subplot(3, 1, 1);
stem(n, original);
xlabel("n");
ylabel("x(n)");
title("Original");
axis([-7 7 -10 10]);

subplot(3, 1, 2);
stem(n, folding);
xlabel("n");
ylabel("x(-n)");
title("Folded");
axis([-7 7 -10 10]);

subplot(3, 1, 3);
stem(n, shifting);
xlabel("n");
ylabel("x(2-n)");
title("Shifted");
axis([-7 7 -10 10]);


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
