% 2.5 Computer Problems: 6

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

% initialize
TOL = 0.5e-3; % ensure 3 correct decimal places
x = ones(n, 1);
x(2:2:end, :) = -1; % create accurate solution x
x_compute = zeros(n, 1); % initialize x_compute
steps = 0;
% using G-S
while norm(x - x_compute, inf) >= TOL
    x_compute = (L + D) \ (b - U * x_compute);
    steps = steps + 1;
end
% output G-S
steps_gs = steps

% initialize again
x_compute(:) = 0; % initialize x_compute
steps = 0;
omega = 1.5;
% using SOR
while norm(x - x_compute, inf) >= TOL
    x_compute = (omega * L + D) \ (omega * b - omega * U * x_compute + (1 - omega) * D * x_compute);
    steps = steps + 1;
end
% output SOR
steps_sor = steps