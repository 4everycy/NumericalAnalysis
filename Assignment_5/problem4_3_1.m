% 4.3 Computer Problems: 1

A_a = [4 0; 3 1]; A_b = [1 2; 1 1]; A_c = [2 1; 1 -1; 2 1]; A_d = [4 8 1; 0 2 -2; 3 6 7];
[qa, ra] = qrFactorize(A_a)
[qaCheck, raCheck] = qr(A_a, 0)
[qb, rb] = qrFactorize(A_b)
[qbCheck, rbCheck] = qr(A_b, 0)
[qc, rc] = qrFactorize(A_c)
[qcCheck, rcCheck] = qr(A_c, 0)
[qd, rd] = qrFactorize(A_d)
[qdCheck, rdCheck] = qr(A_d, 0)

function [q, r] = qrFactorize(A)
n = size(A, 2);
q = zeros(size(A));
r = zeros(n);
for j = 1:n
    y = A(:, j);
    for i = 1:(j-1)
       r(i, j) = q(:, i)' *  A(:, j);
       y = y - r(i, j) * q(:, i);
    end
    r(j, j) = sqrt(sum(y.^2));
    q(:, j) = y / r(j, j);
end
end