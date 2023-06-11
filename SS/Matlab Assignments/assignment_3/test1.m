t = -5:1:5;
x3 = exp(-2*t).*arrayfun(@u, t-1) + arrayfun(@u, -t-1);
stem(t, x3);
axis([-1 1 0 2]);

function output = u(input)
if input >= 0
    output = 1;
else
output = 0;
end
end