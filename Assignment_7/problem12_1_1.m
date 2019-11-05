% 12.1 Computer Problems: 1

format long;
A1 = [10 -12 -6; 5 -5 -4; -1 0 3];
A2 = [-14 20 10; -19 27 12; 23 -32 -13];
A3 = [8 -8 -4; 12 -15 -7; -18 26 12];
A4 = [12 -4 -2; 19 -19 -10; -35 52 27];
x0 = [1; 1; 1];
[egValue1, egVector1] = powerItr(A1, x0, 20)
[egValue2, egVector2] = powerItr(A2, x0, 20)
[egValue3, egVector3] = powerItr(A3, x0, 20)
[egValue4, egVector4] = powerItr(A4, x0, 20)



function [lam, u] = powerItr(A, x, k)
for j = 1:k
    u = x / norm(x);
    x = A * u;
    lam = u' * x;
end
u = x / norm(x);
end