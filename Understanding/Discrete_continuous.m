% Illustrates that frequency and discrete space (Laplace and Z) are
% fundementally different

% There are discrete systems that do not have a direct equivilant in
% continous space (as indicated by the 2nd example)

% You cannot directly convert s to z as they have different domains

% Best to think of converting between laplace and z space as a mapping to
% match progressions over time

% When designing we may model a system by simlply receiving discrete sensor
% readings and using a discrete time model to approximate it

% How can discrete models be derived from first principles??




numerator = [.5 -1.2 .7];
denominator = [1 0 0 0];
ts = 0.1;
sysd = tf(numerator,denominator,ts) 
%sysc = d2c(sysd) %- Doesnt like it, as there are poles near the origin
step(sysd)
figure
%hold on
%step(sysc)


numerator2 = [.5];
denominator2 = [1 .5];
ts = 0.1;
sysd2 = tf(numerator2,denominator2,ts) 
sysc2 = d2c(sysd2) % - Must increase order
sysd2_1 = c2d(sysc2, ts) % -
step(sysd2)
hold on
step(sysc2)
hold on
step(sysd2_1)
