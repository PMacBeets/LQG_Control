clc 
clear all
syms 
ks = 8;
c = 6;

syms k t q_ n p l

d = .5; % discretization

s = tf('s');
z = tf('z',d);

s_ = sym('s')
z_ = sym('z')

A = [-c -ks; 1 0];
B = [2;0];
C = [0 1];
D = [0];

sys = ss(A,B,C,D);
G_s = tf(sys)
%syms d %uncomment this to get in terms of delta
% Find zoh the long way
y_s_step = tf2sym(G_s/s);
y_t_step_zoh = ilaplace(y_s_step); % find time repsonse to step
y_k_step_zoh = subs(y_t_step_zoh,t,d*k); %substitute t with d*k
y_z_step_zoh = ztrans(y_k_step_zoh,q_);  %Z transform discretized signal
y_series(n) = iztrans(y_z_step_zoh,n); % Series 
G_z_zoh = simplify(expand((q_-1)/q_*y_z_step_zoh));  %Get rid of the discrete step
G_z_zoh = vpa(eval(G_z_zoh));

%fin tustin the long way
y_s = tf2sym(G_s);
G_z_tustin = vpa(simplify(expand(subs(y_s,p,2/d*(q_-1)/(q_+1))))); %Discretize
y_z_step_tustin = G_z_tustin*q_/(q_-1); % Add Step
y_k(n) = iztrans(y_z_step_tustin,n); % Get into discrete time domain

%find discrete delta
y_z_zoh_dd = d*subs(y_z_step_zoh,q_,d*l+1)
y_z_tustin_dd = d*subs(y_z_step_tustin,q_,d*l+1)

%% Explore Impulse Respone Solution for ZOH & Tustin Methods

G_z_zoh = c2d(G_s,d,'zoh') % Check usig built in zoh MATLAB function
G_z_tustin = c2d(G_s,d,'tustin')


Tc = 0:d:10;
Td = 0:d:10;
Uc = ones(1,length(Tc));
Ud = ones(1,length(Td));
lsim(G_s,Uc,Tc)
hold on
lsim(G_z_zoh,Ud,Td)
hold on
lsim(G_z_tustin,Ud,Td)
legend({'Continous','ZOH','Tustin'})

