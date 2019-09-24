% 1.1 Computer Problems: 2


format long;
% define the functions
fa = @(x) x.^5 + x -1;
fb = @(x) sin(x) - 6 * x -5;
fc = @(x) log(x) + x.^2 -3;

TOL = 0.5 * 10^(-8); % set the tolerence to ensure that the root has 8 correct decimal places

% compute the root of function (a)
i = 0; j = 1; % initialise the interval for function (a)
while (j - i) / 2 >= TOL
    k = (i + j) / 2;
    if fa(k) == 0
        break
    end
    if sign(fa(k)) * sign(fa(i)) < 0
        j = k;
    else
        i = k;
    end   
end
% output the root of function (a)
root_a = (i + j) / 2

% compute the root of function (b)
i = -1; j = 0; % initialise the interval for function (b)
while (j - i) / 2 >= TOL
    k = (i + j) / 2;
    if fb(k) == 0
        break
    end
    if sign(fb(k)) * sign(fb(i)) < 0
        j = k;
    else
        i = k;
    end   
end
% output the root of function (b)
root_b = (i + j) / 2

% compute the root of function (c)
i = 1; j = 2; % initialise the interval for function (c)
while (j - i) / 2 >= TOL
    k = (i + j) / 2;
    if fc(k) == 0
        break
    end
    if sign(fc(k)) * sign(fc(i)) < 0
        j = k;
    else
        i = k;
    end   
end
% output the root of function (c)
root_c = (i + j) / 2
