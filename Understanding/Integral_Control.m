clc
clear all

syms k1 k2 kz s

A = [-10 1; -0.02 -2];
B = [0; 2];
C = [1 0];
D= 0;

sys = ss(A,B,C,D);
G = tf(sys)


A_ = [A zeros(2,1); -C 0]
B_ = [B;0];
Bb = [0;0;1];
C_ = [0 0 1];
D_= 0;
sys_mod = ss(A_,B_,C_,D_)
det(s*eye(2) -A)



K = [k1 k2 kz];


G_mod = tf(sys_mod)

%s = tf('s');
G_mod = C_*inv(s*eye(3) -A_+B_*K)*Bb
det(s*eye(3) -A_+B_*K)


