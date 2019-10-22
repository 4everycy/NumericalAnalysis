% 3.2 Computer Problems: 1

format long;
% (a)
x0 = [0.6 : 0.1 : 1];
y0 = [1.433329 1.632316 1.896481 2.247908 2.718282];
n = length(x0);
coe = newtdd(x0, y0, n)
% (b)
x1 = 0.82; x2 = 0.98;
P1 = nest(n-1, coe, x1, x0)
P2 = nest(n-1, coe, x2, x0)
% (c)
upperBound1 = findUpperBound(x1, x0)
upperBound2 = findUpperBound(x2, x0)
% (d)
itv1 = [0.5 : 0.01 : 1];
itv2 = [0 : 0.01 : 2];
actualError1 = nest(n-1, coe, itv1, x0);
actualError2 = nest(n-1, coe, itv2, x0);
subplot(1, 2, 1)
plot(x0, y0, 'o', itv1, actualError1, 'LineWidth',1.5)
title('[0.5, 1]')
xlim([0.5 1])
xlabel('x')
ylabel('Actual Error')
subplot(1, 2, 2)
plot(x0, y0, 'o', itv2, actualError2, 'LineWidth',1.5)
title('[0, 2]')
xlim([0 2])
xlabel('x')
ylabel('Actual Error')


% local functions
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

% find error's upper bound for function in (c)
function upperBound = findUpperBound(x, x0)
E = exp(1);
% the interval of x is [0, 1], the 5th derivative of f is
% 120*x*E^(x^2)+160*x^3*E^(x^2)+32*x^5*E^(x^2)
dfc_max = (120 + 160 + 32) * E;
fx = @(x) abs(prod(x - x0)) / factorial(5);
upperBound = fx(x);
end