% 4.1 Computer Problems: 1

A_a = [3 -1 2; 4 1 0; -3 2 1; 1 1 5; -2 0 3];
b_a = [10; 10; -5; 15; 0];
A_b = [4 2 3 0; -2 3 -1 1; 1 3 -4 2; 1 0 1 -1; 3 1 3 -2];
b_b = [10; 0; 2; 0; 5];
x_a = computeLeastSquare(A_a, b_a)
error_a = computeError(A_a, b_a, x_a)
x_b = computeLeastSquare(A_b, b_b)
error_b = computeError(A_b, b_b, x_b)

% local functions
% compute the least square solution
function x = computeLeastSquare(A, b)
x = (A' * A) \ (A' * b);
end

% compute the 2-norm error
function normError = computeError(A, b, x)
r = b - A * x;
SE = sum(r.^2);
normError = sqrt(SE);
end