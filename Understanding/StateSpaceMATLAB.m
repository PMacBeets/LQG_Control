A = [ 1 2; 3 7];
B = [ 0; 1];
C = [1 0];
D = [0];

%% Symbolic TF
syms s
G1(s) = C*inv(s*eye(2)-A)*B


%% Built in
[num,den] = ss2tf(A,B,C,D)
G2 = tf(num,den)

%% Get ss Directly
G3 = ss(A,B,C,D);

%% Re- Extract State space values
G3.A
G3.B

% Note: You cant get them from just TF
% G2.A <- You would get an error here

%% Check Controllability
ctrb(A,B)
ctrb(G3)

%% Check Obervability
obsv(A,C)

%% Compute Controllability & Observability in Staircase form

[Abar_c,Bbar_c,Cbar_c,T_c,k_c] = ctrbf(A,B,C)
[Abar_o,Bba_o,Cbar_o,T_o,k_o] = obsvf(A,B,C)

% See uncontrollable expample 
A_uc = [-1 1; 2 0];
B_uc = [1; -1];
C_uc = [1 0];
D_uc = [0];
[Abar_uc,Bbar_uc,Cbar_uc,T_uc,k_uc] = ctrbf(A_uc,B_uc,C_uc)

G4 = ss(A_uc,B_uc,C_uc,D_uc)
step(G4) % acts like normal tranfer function

%% Discretization
sample_time = 10;
G4_d = c2d(G4, sample_time, 'zoh');
[NUM_C,DEN_C] = tfdata(G4_d,'v');  % get numerators from system

% Simple Discretization
syms s z
G5 = 1/s;
G5_d = simplifyFraction(subs(G5, s, (z-1)/sample_time)); 
[num, den] =  numden(G5_d);
num = coeffs(num);
den = coeffs(den);
num = double(flip(num));
den = double(flip(den));
G5_d = tf(num, den, sample_time)
[NUM,DEN] = tfdata(G5_d,'v');

%% laplacing & Z transforming symbols
syms s t z
G6 = 1/s
G7 = z/(z-1)
ilaplace(G6) % Cannot Take actual s = tf('s') values
laplace(t)
ztrans(t)
iztrans(G7)

%% Matrix exponential
sample_time = .1;
expm(A)

