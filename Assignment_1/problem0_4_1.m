% 0.4 Computer Problems: 1


format long;
result_a = zeros(14, 3);
result_b = zeros(14, 3);
% compute the results
for index = 1: 14
    x = 10^(-index);
    result_a(index, 1) = (1 - sec(x)) / tan(x)^2; % compute the result of expression (a)    
    result_a(index, 2) = -cos(x) / (1 + cos(x)); % alternative form of expression (a)
    result_b(index, 1) = (1 - (1 - x)^3) / x; % compute the result of expression (b)
    result_b(index, 2) = 1 + (1 - x) * (2 - x); % alternative form of expression (b)
    % caculate the correct digits
    n = 0;
    m = 0;
    result_a(index, 3) = n;
    result_b(index, 3) = m;
    while abs(result_a(index, 1) - result_a(index, 2)) < 0.5 * 10^(-n)
        n = n + 1;
        result_a(index, 3) = n;
    end
    while abs(result_b(index, 1) - result_b(index, 2)) < 0.5 * 10^(-m)
        m = m + 1;
        result_b(index, 3) = m;
    end
end
result_a % output the results and correct digits of (a)
result_b % output the results and correct digits of (b)


