%% State-Feedback LQR Control Design

quanser_aero_parameters_OurVals1;
quanser_aero_state_space;

Q = diag([200 75 0 0]);
R = 0.01*eye(2,2);
K = lqr(A,B,Q,R);