elements = [2, 4, -3, 1, -5, 4, 7];
origin = 4;
range = 10;
step = 1;
n = domain(range, step);
%{
x = generate(elements, origin, range, step);
x1 = 2.*shift(x, -3, range, step);
x2 = 2.*fold(x, range, step);
x3 = step(x, 3, range, step);
x4 = 4.*step(shift(x, 4, range, step), 2, range, step);
x5 = 2.*exp(0.5.*domain(range, step)).*x;
x6 = shift(fold(x, range, step), -2, range, step);
%}

x = generate(elements, origin, range, step);
x1 = scale(x, 0.5, range, step);
subplot(2, 1, 1);
stem(n, x);
grid("on");
subplot(2, 1, 2);
stem(n, x1);
grid("on");




function output = domain(range, step)
if(range<0)
    error("Error in domain.\nrange must be non-negative.");
end
if(step<=0)
    error("Error in domain.\nstep must be positive.");
end
output = -range:step:range;
end

function output = generate(elements, origin, range, step)
if(range<0)
    error("Error in generate.\nrange must be non-negative.");
end
if(step<=0)
    error("Error in generate.\nstep must be positive.");
end
left_padding = floor(range/step)+1-origin;
right_padding = floor(range/step)+origin-length(elements);
if((left_padding<0)||(right_padding<0))
    error("Error in generate.\nelements exceed domain.");
end
output = [zeros(1,left_padding), elements, zeros(1,right_padding)];
end

function output = fold(elements, range, step)
if(range<0)
    error("Error in fold.\nrange must be non-negative.");
end
if(step<=0)
    error("Error in fold.\nstep must be positive.");
end
output_length = 2*floor(range/step)+1;
if(length(elements)~=output_length)
    error("Error in fold.\nsize of elements dosen't match the size of domain (given by range and step).");
end
result = zeros(1, output_length);
for i=1:output_length
    result(i) = elements(output_length+1-i);
end
output = result;
end

function output = shift(elements, offset, range, step)
if(range<0)
    error("Error in shift.\nrange must be non-negative.");
end
if(step<=0)
    error("Error in shift.\nstep must be positive.");
end
output_length = 2*floor(range/step)+1;
if(length(elements)~=output_length)
    error("Error in shift.\nsize of elements dosen't match the size of domain (given by range and step).");
end
result = zeros(1, output_length);
offset = to_int(offset);
if(offset==0)
    output = elements;
    return;
elseif(abs(offset)<output_length)
    if(offset>0)

        for i=1:output_length-offset
            result(i) = elements(i+offset);
        end
    else
        for i=1-offset:output_length
            result(i) = elements(i+offset);
        end

    end
end
output = result;
end

function output = scale(elements, factor, range, step)
if(range<0)
    error("Error in step.\nrange must be non-negative.");
end
if(step<=0)
    error("Error in step.\nstep must be positive.");
end
output_length = 2*floor(range/step)+1;
if(length(elements)~=output_length)
    error("Error in step.\nsize of elements dosen't match the size of domain (given by range and step).");
end
result = zeros(1, output_length);
origin = (range/step) + 1;
half = 0;
if(abs(factor) == 1)
    if(factor > 0)
        output = elements;
        return;
    else
        output = fold(elements, range, step);
        return;
    end
else
    half = range/(step*factor);
end
if(half > floor(range/step))
    half = floor(range/step);
end
for i = -half:1:half
    disp("index before: ");
    disp(origin + i);
    index = to_int(origin + i);
    disp("index after");
    disp(index);
    result(index) = elements(to_int(origin+i*factor));
end
output = result;
end

function output = to_int(input)
disp("input is:");
disp(input);
output = floor(abs(input))*(input/abs(input));
disp("output is:");
disp(output);
end


