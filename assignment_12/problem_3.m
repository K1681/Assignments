clear;
syms t;

%%%%%%%%
x(t) = 5*sin(8000*pi*t);
time_period = 1/4000;
range = 0.001;
bit_depths = [5, 10];
%%%%%%%%

number_of_depths = length(bit_depths);
subplot(number_of_depths+1, 2, 1);
fplot(x, [-range, range]);
title("Analog signal", "2*cos(20*pi*t)");
xlabel("t");
ylabel("x(t)");

for i = 1:1:number_of_depths
    digital = digitize(x, time_period, range, bit_depths(i));
    error_value = error(x, digital, range, time_period);

    subplot(number_of_depths+1, 2, 2*i+1);
    stem(digital(1, :), digital(2, :));
    title("Digital signal", sprintf("bit_depth = %f", bit_depths(i)));
    xlabel("t");
    ylabel("xr(t)");

    subplot(number_of_depths+1, 2, 2*i+2);
    stem(error_value(1, :), error_value(2, :));
    title("Error in signal", sprintf("bit_depth = %f", bit_depths(i)));
    xlabel("t");
    ylabel("abs(x(t)-xr(t))");
    digital = 0;
    error_value = 0;
end


function output = digitize(func, T, range, bits)

% preparing to sample.
Ts = T/10; % since Fs > 2*F -> Ts < T/2, hence let Ts = T/3;
half = floor(range/Ts);
length_of_signal = 2*half+1;
signal_origin = half + 1;
result = zeros(1, length_of_signal);

% sampling.
for i = -half:1:half
    result(signal_origin+i) = func(i*Ts);
end

% preparing to quantize.
number_of_levels = 2^bits-1;
level_range = (number_of_levels-1)/2;
level_origin = level_range + 1;
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

function output = error(func, signal, range, T)

Ts = T/10;
half = floor(range/Ts);
length_of_signal = 2*half+1;
signal_origin = half + 1;
error = zeros(1, length_of_signal);

for i = -half:1:half
    error(signal_origin+i) = abs(func(i*Ts) - signal(signal_origin+i));
end

output = [-half*Ts:Ts:half*Ts; error];
end
