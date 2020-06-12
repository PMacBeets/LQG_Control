
Jp = 0.0208;
Jy = 0.0220;
Dp = 0.0078;
Dy = 0.0011;
Ksp = 0.0512;
Kpp = 0.00115; % Seems Right
Kyy = 0.00054;
Kpy = 0.00068;
Kyp = -0.0002

%filter
%wo = 10;
wo = 30;
  
%syms Jp Jy Dp Dy Ksp Kpp Kyy Kpy Kyp
  
A = [0 0 1 0; 
     0 0 0 1;
     -Ksp/Jp 0  -Dp/Jp 0;
     0 0 0 -Dy/Jy];
B = [0 0; 0 0; Kpp/Jp Kpy/Jp; Kyp/Jy Kyy/Jy];
C = [0 1 0 0; 0 1 0 0];
D = [0 0; 0 0];
  
w1 = 2*pi/5;
w2 = 2*pi/10;
   
 %Aref = [0 w1 0 0; -w1 0 0 0; 0 0 0 w2; 0 0 -w2 0];
 %Aref = [0 0 w1 0; 0 0 0 w2; -w1 0 0 0; 0 -w2 0 0];
 
 Aref = [0 w1 0 0; -w1 0 0 0; 0 0 0 w2; 0 0 -w2 0];
 Cref = [1 0 0 0; 0 0 1 0 ];
   
A_aug = [A B*Cref; zeros(4,4) Aref]
B_aug = [B; zeros(4,2)]
C_aug = [C zeros(2,4)]
D_aug = [zeros(2,2)]

sys = ss(A, B, C, D);
sys_aug = ss(A_aug, B_aug, C_aug, D_aug);

% For two position sensors
%LQR
% Q = 500000*diag([100 1 0 0]);
% R = eye(2);
% %Kalman
% V = 0.01*eye(2);
%W = 0.5*eye(8);
% 

%% Original - Exp1
Q = 1000*diag([1 3 0 0]);
R = eye(2);
W = 0.1*diag([80 1 80 1 0.001 0.001 0.001 0.001]);
V = 2e-6*diag([100000 1]);

%% Compare - Exp2
Q1 = 1000000*diag([1000 1 0 0]);
R1 = eye(2);
W1 = 0.1*diag([80 1 80 1 0.001 0.001 0.001 0.001]);
V1 = 2e-6*diag([1000000 1]);

%% Original
[J,S,P] =  lqr(A_aug', C_aug', W, V, zeros(8,2))
J = J';

[K,S,e] = lqr(sys, Q, R, zeros(4,2))
K = [K Cref]; 
N = K(1:2,1:2)

%% Compare
[J1,S1,P1] =  lqr(A_aug', C_aug', W1, V1, zeros(8,2))
J1 = J1';

[K1,S1,e1] = lqr(sys, Q1, R1, zeros(4,2))
K1 = [K1 Cref]; 
N1 = K1(1:2,1:2)
  
