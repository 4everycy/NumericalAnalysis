% 3.4 Computer Problems: 1

x_a = [0 1 2 3]; y_a = [3 5 4 1];
x_b = [-1 0 3 4 5]; y_b = [3 5 1 1 1 ];
subplot(1, 2, 1)
plotSpline(x_a, y_a, 100);
title('case(a)')
xlabel('x')
ylabel('y')
subplot(1, 2, 2)
plotSpline(x_b, y_b, 100);
title('case(b)')
xlabel('x')
ylabel('y')

% local functions
% compute the coefficients
function coef = computeCoef(x, y)
n = length(x); A = zeros(n); r = zeros(n, 1); coef = zeros(n, 3); % inicialize
for i = 1:n-1
    dx(i) = x(i+1) - x(i);
    dy(i) = y(i+1) - y(i);
end
for i = 2:n-1
    A(i, i-1:i+1) = [dx(i-1) 2*(dx(i-1)+dx(i)) dx(i)];
    r(i) = 3 * (dy(i)/dx(i) - dy(i-1)/dx(i-1));
end
A(1, 1) = 1; A(n, n) = 1; % natual spline conditions
coef(:, 2) = A \ r;
for i = 1:n-1
    coef(i, 1) = dy(i) / dx(i) - dx(i) / 3 * (2*coef(i, 2) + coef(i+1, 2));
    coef(i, 3) = (coef(i+1, 2) - coef(i, 2)) / (3 * dx(i));
end
coef = coef(1:n-1, 1:3);
end

% plot
function [x, y] = plotSpline(x_0, y_0, k)
n = length(x_0); x = []; y = [];
coef = computeCoef(x_0, y_0);
for i = 1:n-1
    xp = linspace(x_0(i), x_0(i+1), k+1);
    dx = xp - x_0(i);
    yp = coef(i, 3) * dx;
    yp = (yp + coef(i, 2)) .* dx;
    yp = (yp + coef(i, 1)) .* dx + y_0(i);
    x = [x; xp(1:k)']; y = [y; yp(1:k)'];
end
x = [x; x_0(end)]; y = [y; y_0(end)];
plot(x_0, y_0, 'o', x, y, 'LineWidth',1.5)
end