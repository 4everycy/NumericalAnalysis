% 1.3 Computer Problems: 3

format long;
f = @(x) 2 * x * cos(x) - 2 * x + sin(x)^3;
root_compute = fzero(f, [-0.1, 0.2]); % compute the root using function fzero
root = 0; % the accurate root

% compute and output errors
forwardError = abs(f(root_compute))
backwardError = abs(root_compute - root)

% using bisection method
i = -0.1; j = 0.2; LAST = 100;
k = (i + j) / 2;
while abs(k - root) < LAST
    LAST = abs(k - root);
    k = (i + j) / 2;
    if f(k) == 0
        break
    end
    if sign(f(k)) * sign(f(i)) < 0
        j = k;
    else
        i = k;
    end
    k = (i + j) / 2;
end
root_bisection = k

