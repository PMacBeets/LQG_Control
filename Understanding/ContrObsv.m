A = [0 1; 2 3];
B = [0;1];
C1 = [1 1];
C2 = [1 0];
C3 = [0 1];
D =0;

sys1 = ss(A,B,C1,D)
sys2 = ss(A,B,C2,D)
sys3 = ss(A,B,C3,D)

% All controllable
ctrb(sys1)
ctrb(sys2)
ctrb(sys3)

% All Observable
obsv(sys1)
obsv(sys2)
obsv(sys3)

G_s1 = tf(sys1)
G_s2 = tf(sys2)
G_s3 = tf(sys3)




