% 3.1 Computer Problems: 3

function y0= polyinterp(x, y, x0)
n = length(x);
coef = newtdd(x, y, n);
y0 = nest(n-1, coef, x0, x);
end

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