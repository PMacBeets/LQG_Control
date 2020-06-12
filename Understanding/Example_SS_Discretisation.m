clc 
clear all
syms 
ks = 8;
c = 6;

syms k t q_ n p l

d = .5; % discretization

s = tf('s');
z = tf('z',d);

% Continous
A = [-c -ks; 1 0];
B = [2;0];
C = [0 1];
D = [0];

A_q = expm(A*d);
B_q = inv(A)*(A_q-eye(2))*B;

A_d = (A_q-eye(2))/d;
B_d = B_q/d;


sys_c = ss(A,B,C,D);
sys_q = ss(A_q,B_q,C,D,d)
sys_d = ss(A_d,B_d,C,D,d)

sysq = c2d(sys_c,d,'zoh')

% Compare trasfer fucntions
G_sq = tf(sysq) % Same as worked out in laplace
%G_s_q = vpa(eval(simplify(expand(C*inv(q_*eye(2) - A_q)*B_q)))) %% Correct - using z it doesnt simplify
%[num,den] = ss2tf(A_q,B_q,C,D)
G_s_q = tf(sys_q)



step(sysq)
title('Step Response Of MATLABED discretization')
figure
z = tf('z',d); 


%G_s_d = C*inv(z*eye(2) - A_d)*B_d

Tc = 0:d/10:10;
Td = 0:d:10;
Uc = ones(1,length(Tc)); %sin(Tc);%
Ud = ones(1,length(Td)); %sin(Td);%
lsim(G_s_q,Ud,Td)
title('Step Response Discetised System lsim vs x[k] solution ')
hold on
%lsim(G_s_d,Ud,Td)

% Simulate Using Discretised Solution
xo = [0;0];
x_vec_q = zeros(2,length(Td));
x_vec_d = zeros(2,length(Td));
tot_q = 0;
tot_d = 0;


for k =1:length(Td) - 1
    for l = 0:k-1 
        tot_q = tot_q + A_q^l*B_q*Ud(k-l); %usually[k-l-1] but not possible due to MATLAB indexing from 1
        tot_d = tot_d + d*(eye(2)+A_d*d)^l*B_d*Ud(k-l);
        
    end
    
    x_vec_q(:,k+1) = A_q^k*xo + tot_q;
    x_vec_d(:,k+1) = (eye(2)+A_d*d)^k*xo + tot_d;
    tot_q = 0; 
    tot_d = 0; 
end
y_vec_q = C*x_vec_q;
y_vec_d = C*x_vec_d;
%figure

stairs(Td,y_vec_q)

figure
title('Shift form Vs Discrete Delta')
stairs(Td,y_vec_q)
hold on
stairs(Td,y_vec_d)
hold on
G_s_c = tf(sys_c)
[y,t,x] = lsim(G_s_c,Uc,Tc);
plot(t,y)
legend({'z','delta','Continuous'})

% not somehow y_vec_q & y_vec_d are not identical but they are plotted like
% they are






%G_s_c = tf(sys_c)
%G_s_q = tf(sys_q)
%G_s_d = tf(sys_d)

