function p = lsmapprox(x, y, n)
% lsmapprox - Approximate a polynomial using the least squares method
% p: vector of coefficients
% x: nodes of approximation
% y: vector of function values in nodes
% n:  order of polynomial

% Check if the input lengths are appropriate
if length(x) ~= length(y) || n + 1 > length(x)
    error("Inappropriate inputs!");
end

% Number of support points
N = length(x);

% Build the Vandermonde matrix
% A Vandermonde matrix is a matrix with the terms of a geometric progression in each row

A = zeros(n+1, N);
for i = 1:n+1
    A(i, :) = x.^(i-1);
end

% Calculate the coefficients using least squares
p = flip(A'\ y');

% Plotting the approximation
xx = linspace(x(1), x(end), 100);
yy = polyval(p, xx);
plot(x, y, 'o', xx, yy);
xlabel('x');
ylabel('y');
title('Least Squares Approximation');
grid on;

end


% TEST:

% Test 1 Linear function
% x = [1, 2, 3];
% y = [2, 4, 6];
% n = 1;
% 
% p = lsmapprox(x, y, n);
% disp('Coefficients:'); disp(p);

% Test 2 Quadratic function
% x = [-1, 0, 1, 2];
% y = [4, 1, 0, 3];
% n = 2;
% 
% p = lsmapprox(x, y, n);
% disp('Coefficients:'); disp(p);

% Test 3 Sine function 
% x = [0, pi/2, pi];
% y = [0, 1, 0];
% n = 1;
% 
% p = lsmapprox(x, y, n);
% disp('Coefficients:'); disp(p);