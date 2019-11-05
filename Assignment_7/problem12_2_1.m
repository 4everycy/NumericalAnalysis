% 12.2 Computer Problems: 1

format long;
A1 = [-3 3 5; 1 -5 -5; 6 6 4];
A2 = [3 1 2; 1 3 -2; 2 2 6];
A3 = [17 1 2; 1 17 -2; 2 2 20];
A4 = [-7 -8 1; 17 18 -1; -8 -8 2];
TOL = 1e-14;
egValue1 = shiftedqr0(A1, TOL)
egValue2 = shiftedqr0(A2, TOL)
egValue3 = shiftedqr0(A3, TOL)
egValue4 = shiftedqr0(A4, TOL)


function lam = shiftedqr0(a, tol)
m = size(a, 1); lam = zeros(m, 1);
n = m;
while n > 1
    while max(abs(a(n, 1:n-1))) > tol
        mu = a(n, n);
        [q, r] = qr(a - mu * eye(n));
        a = r * q + mu * eye(n);
    end
    lam(n) = a(n, n);
    n = n - 1;
    a = a(1:n, 1:n);
end
lam(1) = a(1, 1);
end