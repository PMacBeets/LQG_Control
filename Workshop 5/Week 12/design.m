% Jp = 0.0208;
% Jy = 0.0220;
% Dp = 0.0078;
% Dy = 0.0011;
% Ksp = 0.0512;
% Kpp = 0.00115; % Seems Right
% Kyy = 0.00054;
% Kpy = 0.00068;
% Kyp = -0.0002

%syms Jp Jy Dp Dy Ksp Kpp Kyy Kpy Kyp

A = [0 0 1 0; 
     0 0 0 1;
     -Ksp/Jp 0  -Dp/Jp 0;
     0 0 0 -Dy/Jy];
 B = [0 0; 0 0; Kpp/Jp Kpy/Jp; Kyp/Jy Kyy/Jy];
 C = [1 0 0 0; 0 1 0 0];
 D = [0 0; 0 0];
 r = [B A*B A^2*B A^3*B]

 rank(r)
  ro = [C; C*A; C*A^2; C*A^3]
 rank(ro)
 polesk = [-1 -20 -20 -50];
 K = place(A,B, polesk)
 polesj = [-10 -10 -20 -500];
 J = place(A',C', polesj)'
 
 %syms s
 %cont = s*eye(4,4)-A+B*K;
 %obs = s*eye(4,4)-A+J*C;
 % Verification of Maths
 %co = eval(fliplr(coeffs(det(cont)*det(obs))))
 %roots(co)
%[Abar,Bbar,Cbar,T,k] =ctrbf(A,B,C)
