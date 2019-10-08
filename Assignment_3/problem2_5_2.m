% 2.5 Computer Problems: 2

format long;
% create sparse matrix
n = 100; 
d = ones(n, 1);
D = 2 * speye(n);
L = spdiags(d, 1, n, n);
U = spdiags(d, -1, n, n);
A = L + U + D; % create A
b = zeros(n, 1);
b([1, end]) = [1, -1]; % create b

% computation
TOL = 0.5 * 10^(-3); % ensure 3 correct decimal places
D_inv = (1 / 2) * speye(n);
x = ones(n, 1);
x(2:2:end, :) = -1; % create accurate solution x
x_compute = zeros(n, 1); % initialize x_compute
steps = 0;
while norm(x - x_compute, inf) >= TOL
    x_compute = D_inv * (b - (L + U) * x_compute);
    steps = steps + 1;
end

% output
steps
backwardError = norm(b - A * x_compute, inf)
