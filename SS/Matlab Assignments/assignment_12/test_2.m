clear;
syms t;

%%%%%%%%
x(t) = 5*sin(2*pi*t);
time_period = 1;
range = 1;
bit_depths = 4;
%%%%%%%%

% number_of_depths = length(bit_depths);
subplot(2, 2, 1);
fplot(x, [-range, range]);
title("Analog signal", "2*cos(20*pi*t)");
xlabel("t");
ylabel("x(t)");

subplot(2, 2, 3);
res = digitize(x, time_period, range, bit_depths);
stem(res(1, :).*(time_period/3), res(2, :))

subplot(2, 2, 4);
rec = reconstruct(res, time_period);
stem(rec(1, :), res(2, :));

%{
for i = 1:1:number_of_depths
    digital = digitize(x, time_period, range, bit_depths(i));
    result = reconstruct(digital, time_period);
    error_value = error(x, result, range, time_period);

    subplot(number_of_depths+1, 2, 2*i+1);
    plot(result(1, :), result(2, :));
    title("Reconstructed signal", sprintf("bit_depth = %f", bit_depths(i)));
    xlabel("t");
    ylabel("xr(t)");

    subplot(number_of_depths+1, 2, 2*i+2);
    plot(error_value(1, :), error_value(2, :));
    title("Error in signal", sprintf("bit_depth = %f", bit_depths(i)));
    xlabel("t");
    ylabel("abs(x(t)-xr(t))");
end
%}

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

function output = reconstruct(digital_signal, T)

Ts = T/10;
ws = 2*pi/Ts; % sampling freequency.
w_max = 2*pi/T; % max freequency of signal.
wc = w_max; % cutoff freequency of filter. In ideal case.
syms t;
h(t) = piecewise(t ~= 0, 2*wc*sinc(wc*t)/ws, t == 0, 2*wc/ws);  % filter.

signal_length = length(digital_signal);
half = (signal_length-1)/2;
origin = half+1;
xr = zeros(1, signal_length);
for i = -half:half
    for j = -half:half
        xr(origin+i) = xr(origin+i)+digital_signal(origin + j)*h(i*Ts-j*Ts);
    end
end

output = [-half*Ts:Ts:half*Ts; xr];
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

