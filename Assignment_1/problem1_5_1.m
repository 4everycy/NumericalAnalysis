% 1.5 Computer Problems: 1


format long;
E = exp(1);
% define the functions and derivatives
f_a = @(x) x.^3 - 2 * x -2;
f_b = @(x) E^x + x - 7;
f_c = @(x) E^x + sin(x) -4;

% compute the root of function (a)
x_0 = 1;
x_old = 2;
x = x_old - (f_a(x_old) * (x_old - x_0)) / (f_a(x_old) - f_a(x_0));
while abs(x - x_old) >= 0.5 * 10^(-8)
    x_new = x - (f_a(x) * (x - x_old)) / (f_a(x) - f_a(x_old));
    x_old= x;
    x = x_new;
end
root_a = x

% compute the root of function (b)
x_0 = 1;
x_old = 2;
x = x_old - (f_b(x_old) * (x_old - x_0)) / (f_b(x_old) - f_b(x_0));
while abs(x - x_old) >= 0.5 * 10^(-8)
    x_new = x - (f_b(x) * (x - x_old)) / (f_b(x) - f_b(x_old));
    x_old= x;
    x = x_new;
end
root_b = x

% compute the root of function (c)
x_0 = 1;
x_old = 2;
x = x_old - (f_c(x_old) * (x_old - x_0)) / (f_c(x_old) - f_c(x_0));
while abs(x - x_old) >= 0.5 * 10^(-8)
    x_new = x - (f_c(x) * (x - x_old)) / (f_c(x) - f_c(x_old));
    x_old= x;
    x = x_new;
end
root_c = x
