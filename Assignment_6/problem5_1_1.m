% 5.1 Computer Problems: 1

format long;
f = @(x) sin(x) - cos(x);
df = @(x) cos(x) + sin(x);
n = 12; x0 = 0;
res = zeros(n, 1);
error = zeros(n, 1);
H = zeros(n, 1);
trueRes = df(x0);
for i = 1:n
    h = 10^(-i);
    H(i) = h;
    computeRes = (f(x0+h) - f(x0-h)) / (2*h);
    res(i) = computeRes;
    error(i) = abs(computeRes - trueRes);
end
res
error
semilogx(H, error)
ylabel('Error')
xlabel('h')