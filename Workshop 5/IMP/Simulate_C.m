

clc
clear all
IMP_LQR_Design_Seperation

sim('sim_IMP')
plot(OLC_time(:, 1), OLC_lin(:, 1),OLC_time(:, 1), OLC_lin(:, 2))
title('IMP Reponse to Step with Disturbence'); xlabel('Time (s)'); ylabel('Theta');
legend({'Reference','Output'})


