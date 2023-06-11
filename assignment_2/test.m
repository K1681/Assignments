n = -2*pi:pi/4:4*pi;


a(n)



function output = a(input)
data_locations = -2*pi:pi/4:2*pi;
data = dictionary(data_locations, sin(data_locations));
if ismember(input, data_locations)
    output = data(input);
else
output = 0;
end
end
