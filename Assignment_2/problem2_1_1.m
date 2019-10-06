% 2.1 Computer Problems: 1

format long;
% initialization
a_a = [2 -2 -1; 4 1 -2; -2 1 -1];
b_a = [-2; 1; -3];
a_b = [1 2 -1; 0 3 1; 2 -1 1];
b_b = [2; 4; 2];
a_c = [2 1 -4; 1 -1 1; -1 3 -2];
b_c = [-7; -2; 6];
i = 0; j = 0; k = 0; N = 3; x = zeros(N, 1);

% elimination of a
a = a_a; b = b_a;
for j = 1 : (N - 1)
    for i = (j + 1) : N
        multi = a(i, j) / a(j, j);
        for k = (j + 1) : N
            a(i, k) = a(i, k) - multi * a(j, k);
        end
        b(i) = b(i) - multi * b(j);
    end
end

% back-substitution of a
for i = N : -1 : 1
    for j = (i + 1) : N
        b(i) = b(i) - a(i, j) * x(j);
    end
    x(i) = b(i) / a(i, i);
end

% output of a
x_a = x


% elimination of b
a = a_b; b = b_b;
for j = 1 : (N - 1)
    for i = (j + 1) : N
        multi = a(i, j) / a(j, j);
        for k = (j + 1) : N
            a(i, k) = a(i, k) - multi * a(j, k);
        end
        b(i) = b(i) - multi * b(j);
    end
end

% back-substitution of b
for i = N : -1 : 1
    for j = (i + 1) : N
        b(i) = b(i) - a(i, j) * x(j);
    end
    x(i) = b(i) / a(i, i);
end

% output of b
x_b = x


% elimination of c
a = a_c; b = b_c;
for j = 1 : (N - 1)
    for i = (j + 1) : N
        multi = a(i, j) / a(j, j);
        for k = (j + 1) : N
            a(i, k) = a(i, k) - multi * a(j, k);
        end
        b(i) = b(i) - multi * b(j);
    end
end

% back-substitution of c
for i = N : -1 : 1
    for j = (i + 1) : N
        b(i) = b(i) - a(i, j) * x(j);
    end
    x(i) = b(i) / a(i, i);
end

% output of c
x_c = x