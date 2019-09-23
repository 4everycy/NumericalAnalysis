% define the function nest
% Input:
%   d: degree of polynomial,
%   c: array of d+1 coefficients(constant term first),
%   x: x-coordinate at which to evaluate,
%   b: array of d base points, if needed
% Output:
%   y: value of polynomial at x


function y = nest(d, c, x, b)
if nargin < 4
    b = zeros(d, 1);
end
y = c(d + 1);
for i = d: -1: 1
    y = y .* (x - b(i)) + c(i);
end
end
