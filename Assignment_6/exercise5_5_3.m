% 5.5 Exercise: 3

format long;
f = @(x) x^3 + 2 * x;
f_int = @(x) 1 / 4 * x^4 + x^2;
c = [0.34785484513745 0.65214515486255 0.65214515486255 0.34785484513745];
x = [-0.86113631159405 -0.33998104358486 0.33998104358486 0.86113631159405];
n = 4;
res = 0;
res_c = f_int(1) - f_int(-1);
for i = 1:n
    res = res + c(i) * f(x(i));
end
res
error = abs(res - res_c)