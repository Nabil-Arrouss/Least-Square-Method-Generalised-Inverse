function Aginv = geninv(A)
% GENINV Calculate the generalized inverse of a matrix.
%   Aginv = GENINV(A) returns the generalized inverse of the matrix A.

[m, n] = size(A);

if m >= n && rank(A) == n
    % Overdetermined fullranked case
    fprintf("Overdetermined fullranked case:\n");
    fprintf("Matrix A:\n");
    disp(A);
    
    % Calculate the generalized inverse using the transpose of A
    AtA = A' * A;
    Aginv = inv(AtA) * A';
    fprintf("Generalized Inverse (A+):\n");
    disp(Aginv);

elseif m <= n && rank(A) == m
    % Underdetermined fullranked case
    fprintf("Underdetermined fullranked case:\n");
    fprintf("Matrix A:\n");
    disp(A);
    
    % Calculate the generalized inverse using the original matrix A
    AAt = A * A';
    Aginv = A' * inv(AAt);
    fprintf("Generalized Inverse (A+):\n");
    disp(Aginv);

elseif rank(A) < n && rank(A) < m
    % Not fullranked case
    fprintf("Not fullranked case:\n");
    fprintf("Matrix A:\n");
    disp(A);
    
    % Obtain a subset of A with full column rank. (pseudo-inverse).
    r = rank(A);
    F = A(:, 1:r);

    Aginv = F * pinv(F);
    fprintf("Generalized Inverse (A+):\n");
    disp(Aginv);

else
    % Unexpected case
    error("Unexpected case. Unable to calculate the generalized inverse.");
end

end

% TEST:

% underdetermined fullranked case
% A = [1 2 3; 4 5 6];
% Aginv = geninv(A);

% overdetermined fullranked case
% A = [1 2; 3 4; 5 6];
% Aginv = geninv(A);

% Not fullranked case
% A = [1 2 3; 4 5 6; 7 8 9];
% Aginv = geninv(A);