% 2.4 Exercises: 2

format long;
% initialization
A_a = [1 1 0; 2 1 -1; -1 1 -1];
A_b = [0 1 3; 2 1 1; -1 -1 2];
A_c = [1 2 -3; 2 4 2; -1 0 3];
A_d = [0 1 0; 1 0 2; -2 1 0];
n = 3;

% case a
A = A_a;
P = eye(n);
for j = 1 : (n - 1)
    max = abs(A(j, j)); % row exchange
    p = eye(n);
    maxIndex = j;
    for i = (j + 1) : n
        if abs(A(i, j)) > max
            max = abs(A(i, j));
            maxIndex = i;
        end
    end
    p([j, maxIndex], :) = p([maxIndex, j], :);
    P = p * P;
    A = p * A;
    for i = (j + 1) : n % elimination
        mult = A(i, j) / A(j, j);
        A(i, j) = mult;
        for k = (j + 1) : n
            A(i, k) = A(i, k) - mult * A(j, k);
        end
    end
end
L = eye(n); U = A;
for i = 2 : n % get L and U
    for j = 1 : (i - 1)
        L(i, j) = A(i, j);
        U(i, j) = 0;
    end
end
% output a
L_a = L
U_a = U
P_a = P

% case b
A = A_b;
P = eye(n);
for j = 1 : (n - 1)
    max = abs(A(j, j)); % row exchange
    p = eye(n);
    maxIndex = j;
    for i = (j + 1) : n
        if abs(A(i, j)) > max
            max = abs(A(i, j));
            maxIndex = i;
        end
    end
    p([j, maxIndex], :) = p([maxIndex, j], :);
    P = p * P;
    A = p * A;
    for i = (j + 1) : n % elimination
        mult = A(i, j) / A(j, j);
        A(i, j) = mult;
        for k = (j + 1) : n
            A(i, k) = A(i, k) - mult * A(j, k);
        end
    end
end
L = eye(n); U = A;
for i = 2 : n % get L and U
    for j = 1 : (i - 1)
        L(i, j) = A(i, j);
        U(i, j) = 0;
    end
end
% output b
L_b = L
U_b = U
P_b = P

% case c
A = A_c;
P = eye(n);
for j = 1 : (n - 1)
    max = abs(A(j, j)); % row exchange
    p = eye(n);
    maxIndex = j;
    for i = (j + 1) : n
        if abs(A(i, j)) > max
            max = abs(A(i, j));
            maxIndex = i;
        end
    end
    p([j, maxIndex], :) = p([maxIndex, j], :);
    P = p * P;
    A = p * A;
    for i = (j + 1) : n % elimination
        mult = A(i, j) / A(j, j);
        A(i, j) = mult;
        for k = (j + 1) : n
            A(i, k) = A(i, k) - mult * A(j, k);
        end
    end
end
L = eye(n); U = A;
for i = 2 : n % get L and U
    for j = 1 : (i - 1)
        L(i, j) = A(i, j);
        U(i, j) = 0;
    end
end
% output c
L_c = L
U_c = U
P_c = P

% case d
A = A_d;
P = eye(n);
for j = 1 : (n - 1)
    max = abs(A(j, j)); % row exchange
    p = eye(n);
    maxIndex = j;
    for i = (j + 1) : n
        if abs(A(i, j)) > max
            max = abs(A(i, j));
            maxIndex = i;
        end
    end
    p([j, maxIndex], :) = p([maxIndex, j], :);
    P = p * P;
    A = p * A;
    for i = (j + 1) : n % elimination
        mult = A(i, j) / A(j, j);
        A(i, j) = mult;
        for k = (j + 1) : n
            A(i, k) = A(i, k) - mult * A(j, k);
        end
    end
end
L = eye(n); U = A;
for i = 2 : n % get L and U
    for j = 1 : (i - 1)
        L(i, j) = A(i, j);
        U(i, j) = 0;
    end
end
% output d
L_d = L
U_d = U
P_d = P