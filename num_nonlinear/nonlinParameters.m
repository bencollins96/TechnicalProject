%% Params file 

%Fundamental Constants:
g = 9.81;
mu = 0.5;
m = 0.5;
M = 1;
a =0.001;
b = 1;
l = 0.5;
beta = 0;
omega = 10;


%Equation Constants:
r_0 = sqrt(a^2 + b^2);
r_1 = sqrt(a^2 + 4*b^2);
J = (M/3)*r_0^2;

fddot = 0;

theta_1 = atan(2*b/a);
theta_0 = atan(b/a);