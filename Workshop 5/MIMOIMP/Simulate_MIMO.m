
clc
clear all

PID_1

sim('DOF_template')

plot(Time(:, 1), x_out(:, 1),Time(:, 1), x_out(:, 2))
title('x'); xlabel('Time (s)'); ylabel('x');
legend({'Reference','Output'})


