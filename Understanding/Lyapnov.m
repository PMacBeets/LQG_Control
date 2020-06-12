syms a b c d x1 x2
A = [a b ; c d];
X = [x1;x2];

X_dot = A*X
transpose(X_dot)
transpose(X)*transpose(A)