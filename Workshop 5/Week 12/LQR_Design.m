Jp = 0.0208;
Jy = 0.0220;
Dp = 0.0078;
Dy = 0.0011;
Ksp = 0.0512;
Kpp = 0.00115; % Seems Right
Kyy = 0.00054;
Kpy = 0.00068;
Kyp = -0.0002
 
%syms Jp Jy Dp Dy Ksp Kpp Kyy Kpy Kyp
 
A = [0 0 1 0; 
     0 0 0 1;
     -Ksp/Jp 0  -Dp/Jp 0;
     0 0 0 -Dy/Jy];
 B = [0 0; 0 0; Kpp/Jp Kpy/Jp; Kyp/Jy Kyy/Jy];
 C = [1 0 0 0; 0 1 0 0];
 D = [0 0; 0 0];
 

 %Q = diag([7500,400,0,0]);
 %R = [.1 0; 0 .1];
 Q = 2*eye(4);
 R = eye(2);
 
 %polesj = [-10 -10 -10 -10]; % Doesnt change anything becuase model is same as plant
 %J = place(A',C', polesj)'
 
 polesj = [-10 -10 -20 -500];
 J = place(A',C', polesj)'
 

 [K,S,e] = lqr(A, B, Q, R, zeros(4,2))

 

%[Abar,Bbar,Cbar,T,k] =ctrbf(A,B,C)