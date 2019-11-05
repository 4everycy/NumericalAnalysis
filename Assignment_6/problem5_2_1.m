% 5.2 Computer Problems: 1

format long;
% 1(a)
f1 = @(x) x / sqrt(x^2 + 9);
f1_int = @(x) sqrt(x^2 + 9);
a1 = 0; b1 = 4;
res1_c = f1_int(b1) - f1_int(a1);
% 16 panels
n1 = 16;
% trapezoid
res1_t1 = intTrapezoid(a1, b1, f1, n1)
error1_t1 = abs(res1_t1 - res1_c)
% simpson
res1_s1 = intSimpson(a1, b1, f1, n1)
error1_s1 = abs(res1_s1 - res1_c)
% 32 panels
n2 = 32;
% trapezoid
res1_t2 = intTrapezoid(a1, b1, f1, n2)
error1_t2 = abs(res1_t2 - res1_c)
% simpson
res1_s2 = intSimpson(a1, b1, f1, n2)
error1_s1 = abs(res1_s2 - res1_c)

% 1(c)
E = exp(1);
f2 = @(x) x * E^(x);
f2_int = @(x) (x - 1) * E^(x);
a2 = 0; b2 = 1;
res2_c = f2_int(b2) - f2_int(a2);
% 16 panels
% trapezoid
res2_t1 = intTrapezoid(a2, b2, f2, n1)
error2_t1 = abs(res2_t1 - res2_c)
% simpson
res2_s1 = intSimpson(a2, b2, f2, n1)
error2_s1 = abs(res2_s1 - res2_c)
% 32 panels
% trapezoid
res2_t2 = intTrapezoid(a2, b2, f2, n2)
error2_t2 = abs(res2_t2 - res2_c)
% simpson
res2_s2 = intSimpson(a2, b2, f2, n2)
error2_s2 = abs(res2_s2 - res2_c)

% local functions
% compute integral using trapezoid method
function res = intTrapezoid(a, b, f, n)
h = (b - a) / n;
xPanel = [a:h:b];
for i = 1:n
    int_t(i) = h/2 * (f(xPanel(i)) + f(xPanel(i+1)));
end
res = sum(int_t);
end
% compute integral using simpson method
function res = intSimpson(a, b, f, n)
h = (b - a) / n;
xPanel = [a:h:b];
for i = 1:n
    int_s(i) = h/6 * (f(xPanel(i)) + 4*f((xPanel(i)+xPanel(i+1))/2) + f(xPanel(i+1)));
end
res = sum(int_s);
end