A = [0 1; -2 -1];
B = [1; 0];
C = [1 0];

dt1 = 1;
dt2 = .1;

A_q1 = expm(A*dt1);
A_q2 = expm(A*dt2);
A_d1 = (expm(A*dt1)-eye(2))/dt1;
A_d2 = (expm(A*dt2)-eye(2))/dt2;

B_q1 = inv(A)*(expm(A*dt1)-eye(2))*B;
B_q2 = inv(A)*(expm(A*dt2)-eye(2))*B;
B_d1 = inv(A)*(expm(A*dt1)-eye(2))*B/dt1;
B_d2 = inv(A)*(expm(A*dt2)-eye(2))*B/dt2;

syms x1 x2 u
x = [x1;x2];


% for i = 1:3
%     x_i = A_q1*x(:,i) + B_q1*u
%     x = [x x_i];
% end