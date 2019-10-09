% 2.6 Computer Problems: 6

format long;
n = 1000; 
D = spdiags([1:n]',0, n, n);
temp = 1/2 * ones(n, 1);
U = spdiags(temp, 1, n, n) + spdiags(temp, 2, n, n);
L = spdiags(temp, -1, n, n) + spdiags(temp, -2, n, n);
A = L + U + D; % create A
% print A
spy(A)
disp('press any key to continue...')
pause

x = ones(n, 1);
b = A * x;
steps = 30; % set steps

% CG without preconditioner
x_compute = zeros(n, 1);
r = b - A * x_compute;
d = r;
forwardError = zeros(steps, 1);
for i = 1 : steps
    alpha = (r' * r) / (d' * A * d);
    x_compute = x_compute + alpha * d;
    r_old = r;
    r = r - alpha * A * d;
    beta = (r' * r) / (r_old' * r_old);
    d = r + beta * d;
    forwardError(i) = norm(x - x_compute, inf); % save errors for plotting
end
forwardError_none = forwardError;

% CG with Jacobi preconditioner
M = D;
x_compute(:) = 0;
r = b - A * x_compute;
z = M \ r;
d = z;
forwardError(:) = 0;
for i = 1 : steps
    alpha = (r' * z) / (d' * A * d);
    x_compute = x_compute + alpha * d;
    r_old = r;
    z_old = z;
    r = r - alpha * A * d;
    z = M \ r;
    beta = (r' * z) / (r_old' * z_old);
    d = z + beta * d;
    forwardError(i) = norm(x - x_compute, inf); % save errors for plotting
end
forwardError_jacobi = forwardError;

% CG with G-S preconditioner
M = (D + L) * (D \ (D + U));
x_compute(:) = 0;
r = b - A * x_compute;
z = M \ r;
d = z;
forwardError(:) = 0;
for i = 1 : steps
    alpha = (r' * z) / (d' * A * d);
    x_compute = x_compute + alpha * d;
    r_old = r;
    z_old = z;
    r = r - alpha * A * d;
    z = M \ r;
    beta = (r' * z) / (r_old' * z_old);
    d = z + beta * d;
    forwardError(i) = norm(x - x_compute, inf); % save errors for plotting
end
forwardError_gs = forwardError;

% plot errors
semilogy(forwardError_none, '-o', 'LineWidth',1.5)
title('Errors Comparision')
xlabel('Steps')
ylabel('Forward Error')
hold on
semilogy(forwardError_jacobi, '-s', 'LineWidth',1.5)
semilogy(forwardError_gs, '-^', 'LineWidth',1.5)
legend('No', 'Jacobi', 'G-S')
hold off