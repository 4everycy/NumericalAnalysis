% 3.3 Computer Problems: 2

function y = cosInterpolation(x)
% [0, pi/2]
n = findDegree(0, pi/2, 10); % 10 decimal places correct
x_base = pi / 4 + pi / 4 * cos((1:2:(2*n-1)) * pi / (2*n));
y_base = cos(x_base);
coef = newtdd(x_base, y_base, n);
% extend domain
s = 1; % signal
x = mod(x, 2*pi);
if x > 3*pi/2
    x = 2*pi - x;
elseif x > pi/2
    s = -1;
    x = abs(pi - x);
end
y = s * nest(n-1, coef, x, x_base);
end


% local functions
% find the degree of chebyshev polynomial
function n = findDegree(a, b, p)
    i = 1;
    m = (b - a) / 2;
    tol = m^i / (factorial(i)*2^(i-1));
    while tol >= 0.5 * 10^(-p)
        i = i + 1;
        tol = m^i / (factorial(i)*2^(i-1));
    end
    n = i;
end

% compute coefficients
function c = newtdd(x, y, n)
for j = 1 : n
    newtonTriangle(j, 1) = y(j); % fill in y column of Newton triangle
end
for i = 2 : n
    for j = 1 : (n+1-i)
        newtonTriangle(j, i) = (newtonTriangle(j+1, i-1) - newtonTriangle(j, i-1)) / (x(j+i-1) - x(j));
    end
end
for i = 1 : n
    c(i) = newtonTriangle(1, i);
end
end

% nested multication
function y = nest(d, c, x, b)
if nargin < 4
    b = zeros(d, 1);
end
y = c(d+1);
for i = d: -1: 1
    y = y .* (x - b(i)) + c(i);
end
end
