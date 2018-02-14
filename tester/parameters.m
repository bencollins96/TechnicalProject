%% Params file 

%Fundamental Constants:
g = 9.81;
m = 0.5;
M = 1;
mu = m/M;
a =0.01;
b = 2;
l = 0.25;
beeta = 0;
omega = 10;
r = 0.9;
numImpacts = 10;

%Equation Constants:
r_0 = sqrt(a^2 + b^2);
r_1 = sqrt(a^2 + 4*b^2);
I = g/(mu*a^2 + (4/3)*r_0^2);
J = (M/3)*r_0^2;
theta_0 = atan(b/a);
theta_1 = atan(2*b/a);

A = I*b*(1+2*mu);
B = -I*2*b*mu;
C = I*b/g;
P = -I*a*(1+mu);

D = (2*I*(b^2)*(1+2*mu))/l;
E = -I*(3*mu*r_1^2 + 4*r_0^2)/(3*l);
F = I*(2*b^2 - a^2*(3*mu + 4))/(3*g*l);
Q = -I*(2*a*b*(1+mu))/l;
