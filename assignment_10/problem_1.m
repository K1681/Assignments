syms t;

%%%%%%%%
x(t) = 2*cos(20*pi*t);
time_period = 0.1;
range = 1;
bit_depth = 2;
%%%%%%%%

result = quantize(x, time_period, range, bit_depth);
subplot(2, 1, 1);
fplot(x, [-range, range]);
title("Analog signal", "2*cos(20*pi*t)")
xlabel("t");
ylabel("x(t)");
subplot(2, 1, 2);
plot(result(1, :), result(2, :));
title("Digital signal", "2*cos(20*pi*n)");
xlabel("n");
ylabel("x(n)");


function output = quantize(func, T, range, bits)
% preparing to sample.
Ts = T/10; % since Fs > 2*F -> Ts < T/2, hence let Ts = T/3;
length_of_signal = floor(2*range/Ts)+1;
signal_origin = floor(range/Ts) + 1;
result = zeros(1, length_of_signal);

% sampling.
for i = -floor(range/Ts):1:floor(range/Ts)
    result(signal_origin+i) = func(i*Ts);
end

% preparing to quantize.
number_of_levels = 2^bits-1;
level_origin = (number_of_levels+1)/2;
level_range = (number_of_levels-1)/2;
delta = (max(result) - min(result))/(number_of_levels-1);
levels = zeros(1, number_of_levels);
for i = -level_range:1:level_range
    levels(level_origin+i) = delta*i;
end

% quantizing.
for i = 1:length_of_signal
    for j = 1:(number_of_levels-1)
        if(result(i) <= (levels(j+1)+levels(j))/2)
            result(i) = levels(j);
            break;
        end
        if(j == (number_of_levels-1))
            if(result(i) > (levels(j+1)+levels(j))/2)
                result(i) = levels(j+1);
            end
        end
    end
end

%returning output.
output = [1:1:length_of_signal; result];
end
