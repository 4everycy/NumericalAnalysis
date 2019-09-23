% 0.1 Computer Problems: 1


format long;
x = 1.00001;
% using function nest
result1 = nest(50, ones(51, 1), x)

% using expression
result2 = (x^51 - 1) / (x - 1)

% comparing
error = abs(result1 - result2)



