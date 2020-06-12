% Example from 2018 exam

syms p1 p2 p3 p4

A = [0 1; -16 -3.2];
C = [0.1 0];

P = [p1 p2; p3 p4];

% For Kalman
W = [10 0; 0 10];
V = 0.1;

exp = A'*P +P*A - P*C'*inv(V)*C*P + W;
exp1 = exp(1,1)==0
exp2 = exp(1,2)==0
exp3 = exp(2,1)==0
exp4 = exp(2,2)==0

EXP = [exp1 exp2 exp3 exp4];

solution = solve(EXP,P)
p1 = solution.p1(5)
p2 = solution.p2(5)
p3 = solution.p3(5)
p4 = solution.p4(5)

L = P*C'*inv(V)

% Cant because equations are non -linear
%[C, B] = equationsToMatrix(EXP,P)
