% 4.3 Computer Problems: 3

A_a = [4 0; 3 1]; A_b = [1 2; 1 1]; A_c = [2 1; 1 -1; 2 1]; A_d = [4 8 1; 0 2 -2; 3 6 7];
[qa, ra] = qrHouseholder(A_a)
[qaCheck, raCheck] = qr(A_a)
[qb, rb] = qrHouseholder(A_b)
[qbCheck, rbCheck] = qr(A_b)
[qc, rc] = qrHouseholder(A_c)
[qcCheck, rcCheck] = qr(A_c)
[qd, rd] = qrHouseholder(A_d)
[qdCheck, rdCheck] = qr(A_d)

% local functiongs
% find householder reflector
function H = findHouseholder(x, w)
n = length(x);
x = x(:);
w = w(:);
v = w - x;
P = (v * v') / (v' * v);
H = eye(n) - 2 * P;
end

% QR factorization using householder reflector
function [Q, R] = qrHouseholder(A)
n = size(A, 2);
Q = eye(size(A, 1));
R = A;
for i = 1:n
    x = R(i:end, i);
    xNorm = norm(x);
    if sign(xNorm) * sign(x(1)) > 0
        xNorm = -xNorm;
    end
    w = [xNorm; zeros(length(x)-1, 1)];
    Ht = findHouseholder(x, w);
    H = blkdiag(eye(i-1), Ht);
    Q = Q * H;
    R = H * R;
end
end