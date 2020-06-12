clc
clear all
quanser_aero_parameters_OurVals1_C
%quanser_aero_state_space
IMP_LQR_Design_Seperation_Compare

sim('sim_IMP_LQR_2018_Dist')
plot(OLC_time(:, 1), OLC_lin(:, 1),OLC_time(:, 1), OLC_lin(:, 2),OLC_time(:, 1), OLC_lin(:, 3),OLC_time(:, 1), OLC_lin(:, 4),OLC_time(:, 1), OLC_lin(:, 5),OLC_time(:, 1), OLC_lin(:, 6))
title('Reponse '); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Voltage','Pitch Reference','Pitch Angle','Yaw Voltage','Yaw Reference','Yaw Angle',})
figure

%% Plot Pitch/Yaw - Angle-Vel & Ref for Sim1 Sim2
plot(OLC_time(:, 1), OLC_lin(:, 2),OLC_time(:, 1), OLC_lin(:, 3),OLC_time(:, 1), OLC_lin(:, 5),OLC_time(:, 1), OLC_lin(:, 6))
title('Simulated Response 1'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Pitch Angle','Yaw Reference','Yaw Angle',})
figure

plot(OLC_time(:, 1), OLC_lin1(:, 2),OLC_time(:, 1), OLC_lin1(:, 3),OLC_time(:, 1), OLC_lin1(:, 5),OLC_time(:, 1), OLC_lin1(:, 6))
title('Simulated Response 2'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Pitch Angle','Yaw Reference','Yaw Angle',})
figure


figure
plot(OLC_time(:, 1), OLC_lin(:, 13))
title('Plot Error')



