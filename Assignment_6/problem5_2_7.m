% 5.2 Computer Problems: 7

format long;
f = @(x) atan(x) / x;
a = 0; b = 1;
res16 = intMidpoint(a, b, f, 16)
res32 = intMidpoint(a, b, f, 32)

% local functions
function res = intMidpoint(a, b, f, n)
h = (b - a) / n;
xPanel = [a:h:b];
for i = 1:n
    w = xPanel(i) + h/2;
    int(i) = h * f(w);
end
res = sum(int);
end