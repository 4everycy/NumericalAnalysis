% 2.1 Computer Problems: 1

% initialization
a_a = [2 -2 -1; 4 1 -2; -2 1 -1];
b_a = [-2; 1; -3];
a_b = [1 2 -1; 0 3 1; 2 -1 1];
b_b = [2; 4; 2];
a_c = [2 1 -4; 1 -1 1; -1 3 -2];
b_c = [-7; -2; 6];
i = 0; j = 0; k = 0; n = 3; x = zeros(n, 1);

% elimination of a
a = a_a; b = b_a;
for j = 1 : (n - 1)
    for i = (j + 1) : n
        mult = a(i, j) / a(j, j);
        for k = (j + 1) : n
            a(i, k) = a(i, k) - mult * a(j, k);
        end
        b(i) = b(i) - mult * b(j);
    end
end
% back-substitution of a
for i = n : -1 : 1
    for j = (i + 1) : n
        b(i) = b(i) - a(i, j) * x(j);
    end
    x(i) = b(i) / a(i, i);
end
% output of a
x_a = x

% elimination of b
a = a_b; b = b_b;
for j = 1 : (n - 1)
    for i = (j + 1) : n
        mult = a(i, j) / a(j, j);
        for k = (j + 1) : n
            a(i, k) = a(i, k) - mult * a(j, k);
        end
        b(i) = b(i) - mult * b(j);
    end
end
% back-substitution of b
for i = n : -1 : 1
    for j = (i + 1) : n
        b(i) = b(i) - a(i, j) * x(j);
    end
    x(i) = b(i) / a(i, i);
end
% output of b
x_b = x

% elimination of c
a = a_c; b = b_c;
for j = 1 : (n - 1)
    for i = (j + 1) : n
        mult = a(i, j) / a(j, j);
        for k = (j + 1) : n
            a(i, k) = a(i, k) - mult * a(j, k);
        end
        b(i) = b(i) - mult * b(j);
    end
end
% back-substitution of c
for i = n : -1 : 1
    for j = (i + 1) : n
        b(i) = b(i) - a(i, j) * x(j);
    end
    x(i) = b(i) / a(i, i);
end
% output of c
x_c = x