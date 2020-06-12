A = [ 0 1; -9.81 0];
B = [0 ; 2];
C = [1 0];

% Desired Polynomial
pe = [-20; -20];

% Note: Transposes because of Duality
Jt = acker(A',C',pe)
J = Jt'
