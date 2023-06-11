clear;
syms t;

%%%%%%%%
x(t) = sin(22.5*pi*t)+cos(15*pi*t);
sampling_periods = [0.01, 0.07, 0.1];
range = 1;
bit_depth = 2;
%%%%%%%%

disp(x);
number_of_periods = length(sampling_periods);
for i = 1:number_of_periods
    digital = digitize(x, sampling_periods(i), range, bit_depth);
    fprintf("Sampling Period = %f\n", sampling_periods(i));
    disp(dec2bin(digital(2, :)));
end

function output = digitize(func, T, range, bits)
% preparing to sample.
Ts = T/3; % since Fs > 2*F -> Ts < T/2, hence let Ts = T/3;
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
        if(result(i) <= (levels(j)+levels(j+1))/2)
            result(i) = j-1;
            break;
        end
        if(j == (number_of_levels-1))
            if(result(i) > (levels(j+1)+levels(j))/2)
                result(i) = j;
            end
        end
    end
end

%returning output.
output = [1:1:length_of_signal; result];
end
