clc
clear all

syms d1 d2 d3 d4 n1 n2 n3 n4  J1 J2 J3 J4 K1 K2 K3 K4 s a

% Controllable
Ac = [0 1 0 0; 0 0 1 0; 0 0 0 1; -d4 -d3 -d2 -d1];
Bc = [0;0;0;a];
Cc = [n4 n3 n2 n1];
D = 0;
K = [K1 K2 K3 K4];

det(s*eye(4) - Ac +Bc*K)

% Obervable 
Ao = [ 0 0 0 -d4; 1 0 0 -d3; 0 1 0 -d2; 0 0 1 -d1];
Bo = [n4;n3;n2;n1];
Co = [0 0 0 a];
J = [J1;J2;J3;J4];
det(s*eye(4) - Ao +J*Co)
%
