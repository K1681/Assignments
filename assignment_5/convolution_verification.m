n = -15:1:15;

x = create_array([2, -4, 5, 3, -1, -2, 6], 4, n);
x2 = create_array(x, 16, n);
h = create_array([1, -1, 1, -1, 1], 2, n);

disp(x);


function output = create_array(array, origin, domain)
half = (length(domain) - 1)/2;
output = [zeros(1, half - origin + 1), array, zeros(1, half - length(array) + origin)];
end

function output = scale_array(array, scale)
origin = (length(array)+1)/2;
result = zeros(1, length(array));
half = (length(array)-1)/2;
for i = -half:1:half
    ofset = i*scale;
    if rem(ofset, 1)==0
        if (-half <= ofset)&&(ofset <= half)
            result(origin + i) = array(origin+(i*scale));
        end
    end 
end
output = result;
end
