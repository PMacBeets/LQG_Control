
  
%syms Jp Jy Dp Dy Ksp Kpp Kyy Kpy Kyp
  
A = [0 1; 0 -1];
B = [0 ;2];
C = [1 0];
D = 0
 
wr = 10;
w1 = 2*pi()/5;
   
%Aref = [0 w1 0 0; -w1 0 0 0; 0 0 0 w2; 0 0 -w2 0];


Aref = [ 0 w1; -w1 0];
Cref = [0 1];
   
A_aug = [A B*Cref; zeros(2,2) Aref]
B_aug = [B; zeros(2,1)]
C_aug = [C zeros(1,2)]
D_aug = [0]


size_aug = size(A_aug);
size_aug = size_aug(1);

% For one position on velocity sensor
% LQR
Q = 50*diag([1 1]);
R = eye(1);

%Kalman
W = 1*eye(size_aug);
V = 1;


ctrb(A_aug, B_aug)
obsv(A,C)
rank(obsv(A,C))
 
sys = ss(A, B, C, D);
sys_aug = ss(A_aug, B_aug, C_aug, D_aug);
%For 

% Use Seperation Principle instead of Kalman
[J,S,P] =  lqr(A_aug', C_aug', W, V, zeros(size_aug,1))
J = J';

[K,S,e] = lqr(sys, Q, R, 0)
K = [K Cref]; 
N = C_aug*K'
  
