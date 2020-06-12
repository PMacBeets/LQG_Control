clc
clear all

s = tf('s');

% Controllable part
Ac = [1 0; 3 4];
Bc = [10;11];
Cc = [12 0];

inv(s*eye(2)-Ac)*Bc

% Observable part
Ao = [1 2; 0 7];



A = [1 0 2 0; 3 4 5 6; 0 0 7 0; 0 0 8 9];
B = [10;11;0;0];
C = [12 0 13 0];
D = 0;


sys1 = ss(A,B,C,D);

% Kalman decomposition does not change A,B,C as already in Kalman Canonical
% form
[sys1r, U]= minreal(sys1,1e-10) % where u is the trasnformation
Abar = U*A*U'; % == A
Bbar = U*B;    % == B
Cbar = C*U';   % == C

G_s = tf(sys1);
G_s = C*inv(s*eye(4) - A)*B + D
Controlable = inv(s*eye(4) - A)*B


% Transfer function derives only from controllable and observable part
sys_c = ss(1,10,12, D); % Aoc = 1, Boc = 10, Coc = 12
G_sc = tf(sys_c)


