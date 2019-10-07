% 2.2 Computer Problems: 1

% initialization
A_a = [3 1 2; 6 3 4; 3 1 5];
A_b = [4 2 0; 4 4 2; 2 2 3];
A_c = [1 -1 1 2; 0 2 1 0; 1 3 4 4; 0 2 1 -1];
i = 0; j = 0; k = 0;

% factorize a
n = 3; A = A_a;
L = eye(n);
for j = 1 : (n - 1)
    if abs(A(j, j)) < eps
        error('zero pivot encountered');
    end
    for i = (j + 1) : n
        mult = A(i, j) / A(j, j);
        L(i, j) = mult;
        for k = j : n
            A(i, k) = A(i, k) - mult * A(j, k);
        end
    end
end
L_a = L
U_a = A
LU_a = L_a * U_a

% factorize b
n = 3; A = A_b;
L = eye(n);
for j = 1 : (n - 1)
    if abs(A(j, j)) < eps
        error('zero pivot encountered');
    end
    for i = (j + 1) : n
        mult = A(i, j) / A(j, j);
        L(i, j) = mult;
        for k = j : n
            A(i, k) = A(i, k) - mult * A(j, k);
        end
    end
end
L_b = L
U_b = A
LU_b = L_b * U_b

% factorize c
n = 4; A = A_c;
L = eye(n);
for j = 1 : (n - 1)
    if abs(A(j, j)) < eps
        error('zero pivot encountered');
    end
    for i = (j + 1) : n
        mult = A(i, j) / A(j, j);
        L(i, j) = mult;
        for k = j : n
            A(i, k) = A(i, k) - mult * A(j, k);
        end
    end
end
L_c = L
U_c = A
LU_c = L_c * U_c