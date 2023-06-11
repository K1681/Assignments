range = 10;
k_vals = -range:1:range;
ak = zeros(1, (2*range)+1);
ak_angle = zeros(1, (2*range)+1);
syms t;
%%%%%%%%%
xt = 1/2*(1 - sin(4*pi*t));
T = 1/2;
%%%%%%%%%
for k = k_vals
    temp = (1/T)*int(xt*exp(-1i*k*((2*pi)/T)*t), 0, T);
    ak(range+k+1) = abs(temp);
    ak_angle(range+k+1) = angle(temp);
end
subplot(2, 1, 1)
stem(k_vals, ak);
title("Magnitude");
subplot(2, 1, 2);
stem(k_vals, ak_angle);
title("Phase");
