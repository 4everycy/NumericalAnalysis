% 1.4 Computer Problems: 1


format long;
E = exp(1);
% define the functions and derivatives
f_a = @(x) x.^3 - 2 * x -2;
f_b = @(x) E^x + x - 7;
f_c = @(x) E^x + sin(x) -4;
df_a = @(x) 3 * x.^2 - 2;
df_b = @(x) E^x + 1;
df_c = @(x) E^x + cos(x);

% compute the root of function (a)
x = 1.5; % initial guess of x
x_old = 0;
while abs(x - x_old) >= 0.5 * 10^(-8)
    x_old = x;
    x = x - f_a(x) / df_a(x);
end
root_a = x

% compute the root of function (b)
x = 1.5; % initial guess of x
x_old = 0;
while abs(x - x_old) >= 0.5 * 10^(-8)
    x_old = x;
    x = x - f_b(x) / df_b(x);
end
root_b = x

% compute the root of function (c)
x = 1.5; % initial guess of x
x_old = 0;
while abs(x - x_old) >= 0.5 * 10^(-8)
    x_old = x;
    x = x - f_c(x) / df_c(x);
end
root_c = x
