% 2.3 Computer Problem: 1

format long;

% case a, n = 6
n = 6;
A = zeros(n);
x = ones(n, 1);
for i = 1 : n
    for j = 1 : n
        A(i, j) = 5 / (i + 2 * j - 1);
    end
end
b = A * x;
x_compute = A \ b;
r = b - A * x_compute;
forwardError = norm(x - x_compute, inf);
rBackwardError = norm(r, inf) / norm(b, inf);
rForwardError = forwardError / norm(x, inf);
emf = rForwardError / rBackwardError;

% output a
forwardError_a = forwardError
errorMagnificationFactor_a = emf
conditionNumber_a = cond(A, inf)

% case b, n = 10
n = 10;
A = zeros(n);
x = ones(n, 1);
for i = 1 : n
    for j = 1 : n
        A(i, j) = 5 / (i + 2 * j - 1);
    end
end
b = A * x;
x_compute = A \ b;
r = b - A * x_compute;
forwardError = norm(x - x_compute, inf);
rBackwardError = norm(r, inf) / norm(b, inf);
rForwardError = forwardError / norm(x, inf);
emf = rForwardError / rBackwardError;

% output a
forwardError_b = forwardError
errorMagnificationFactor_b = emf
conditionNumber_b = cond(A, inf)
