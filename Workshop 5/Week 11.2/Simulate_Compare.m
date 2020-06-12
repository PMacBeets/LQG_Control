clc
clear all

exp1 = 'aero_lqr_rsp20';
exp2 = 'aero_lqr_rsp21';

quanser_aero_parameters_OurVals1_C
IMP_LQR_Design_Seperation_Compare

%% Simulate
sim('sim_IMP_LQR_2018_Dist')

%% Plot Pitch/Yaw - Angle-Vel & Ref for Sim1 Sim2
plot(OLC_time(:, 1), OLC_lin(:, 2),OLC_time(:, 1), OLC_lin(:, 3),OLC_time(:, 1), OLC_lin(:, 5),OLC_time(:, 1), OLC_lin(:, 6))
title('Simulated Response 1'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Pitch Angle','Yaw Reference','Yaw Angle',})
figure

plot(OLC_time(:, 1), OLC_lin1(:, 2),OLC_time(:, 1), OLC_lin1(:, 3),OLC_time(:, 1), OLC_lin1(:, 5),OLC_time(:, 1), OLC_lin1(:, 6))
title('Simulated Response 2'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Pitch Angle','Yaw Reference','Yaw Angle',})
figure

%% Plot Both Exp1 & Exp2
load(exp1)
plot(lqr_rsp(1,:),lqr_rsp(3,:),lqr_rsp(1,:),lqr_rsp(4,:),lqr_rsp(1,:),lqr_rsp(6,:),lqr_rsp(1,:),lqr_rsp(7,:))
title('Experiment 1')
legend({'Reference Pitch','Actual Pitch','Reference Yaw','Actual Yaw'})

figure
load(exp2)
plot(lqr_rsp(1,:),lqr_rsp(3,:),lqr_rsp(1,:),lqr_rsp(4,:),lqr_rsp(1,:),lqr_rsp(6,:),lqr_rsp(1,:),lqr_rsp(7,:))
title('Experiment 2')
legend({'Reference Pitch','Actual Pitch','Reference Yaw','Actual Yaw'})
figure

%% Plot Exp1 Vs Sim1
load(exp1)
plot(OLC_time(:, 1), OLC_lin(:, 2),OLC_time(:, 1), OLC_lin(:, 3),lqr_rsp(1,:),lqr_rsp(4,:),OLC_time(:, 1), OLC_lin(:, 5),OLC_time(:, 1), OLC_lin(:, 6),lqr_rsp(1,:),lqr_rsp(7,:))
title('Simulated Response Vs Experiment'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Sim Pitch Angle','Actual Pitch Angle','Yaw Reference','Sim Yaw Angle','Actual Yaw Angle'})
figure

%% Plot Exp2 Vs Sim2
load(exp2)
plot(OLC_time(:, 1), OLC_lin1(:, 2),OLC_time(:, 1), OLC_lin1(:, 3),lqr_rsp(1,:),lqr_rsp(4,:),OLC_time(:, 1), OLC_lin1(:, 5),OLC_time(:, 1), OLC_lin1(:, 6),lqr_rsp(1,:),lqr_rsp(7,:))
title('Simulated Response Vs Experiment'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Sim Pitch Angle','Actual Pitch Angle','Yaw Reference','Sim Yaw Angle','Actual Yaw Angle'})
figure

%% Plot Exp1 Vs Sim1 - Just Pitch
load(exp1)
plot(OLC_time(:, 1), OLC_lin(:, 2),OLC_time(:, 1), OLC_lin(:, 3),lqr_rsp(1,:),lqr_rsp(4,:))
title('Simulated Response Vs Experiment - Pitch'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Sim Pitch Angle','Actual Pitch Angle'})
figure

%% Plot Exp2 Vs Sim2 - Just Pitch
load(exp2)
plot(OLC_time(:, 1), OLC_lin1(:, 2),OLC_time(:, 1), OLC_lin1(:, 3),lqr_rsp(1,:),lqr_rsp(4,:))
title('Simulated Response Vs Experiment - Pitch'); xlabel('Time (s)'); ylabel('Theta');
legend({'Pitch Reference','Sim Pitch Angle','Actual Pitch Angle'})
figure
