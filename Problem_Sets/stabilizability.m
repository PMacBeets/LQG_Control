clc
clear all

A = [1 0 0; 0 -1 0; 0 0 1];
B = [0 ;0 ;1];
C = [1 1 0];
D = 0;

G = ss(A,B,C,D)

[GS,GNS] = stabsep(G)

% Stabilizable
rank(ctrb(GNS.a,GNS.b)) == size(GNS.a,1)

%unstabilizable
rank(ctrb(GNS.a,GNS.b)) < size(GNS.a,1)