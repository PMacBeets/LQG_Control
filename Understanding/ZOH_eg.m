
ts = 1; % discretization

s = tf('s');
z = tf('z',ts)


sys_con = 1/((s+1)*(s+2));
sys_zoh = c2d(sys_con,ts,'zoh')

% From handwork
sys_zoh_hand =  1/2*(z*(exp(-2*ts) - 2*exp(-1*ts) + 1) + (exp(-3*ts) - 2*exp(-2*ts) + exp(-ts)))/(z^2 - z*(exp(-2*ts)+exp(-ts))+exp(-3*ts))

