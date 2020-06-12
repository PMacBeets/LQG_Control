syms s t k z n
d = 0.1
G_s = 0.0146*(1/s-1/(s+20))*s*exp(-.1/.5*s)
y_s_step = G_s/s
y_t_step_zoh = ilaplace(y_s_step) % find time repsonse to step
y_k_step_zoh = subs(y_t_step_zoh,t,d*k) %substitute t with d*k
y_z_step_zoh = ztrans(y_k_step_zoh,z)  %Z transform discretized signal
%y_series(n) = iztrans(y_z_step_zoh,n) % Series 
G_z_zoh = simplify(expand((z-1)/z*y_z_step_zoh))  %Get rid of the discrete step
G_z_zoh = vpa(eval(G_z_zoh))
%y_k = iztrans((z^2*(7.3890560989306504069418224389665*z - 1.0)))  % Denominator
[num,den] = numden(G_z_zoh)
sys = tf2ss(num,den)

step(sys)