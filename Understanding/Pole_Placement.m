s = tf('s');
syms K1 K2 K3

G = 2/(s^3+5*s^2+s-6)
A = [0 1 0; 0 0 1; 6 -1 -5];
B = [0;0;1];
C = [2 0 0];
D = 0;
K = [K1 K2 K3];

sys = ss(A,B,C,D);
tf(sys)


syms s
Acl = s*eye(3)-A+B*K
det(Acl)