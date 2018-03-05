%% Params file 

%Fundamental Constants:
g = 9.81;
mu = 0.5;
a =0.001;
b = 1;
l = 1;
beeta = 0.0001;
omega = 10;
r = 0.9;
numImpacts = 10;

%Equation Constants:
r0 = sqrt(a^2 + b^2);
r1 = sqrt(a^2 + 4*b^2);
I = g/(mu*a^2 + (4/3)*r0^2);

A = I*b*(1+2*mu);
B = -I*2*b*mu;
C = I*b/g;
P = -I*a*(1+mu);

D = (2*I*(b^2)*(1+2*mu))/l;
E = -I*(3*mu*r1^2 + 4*r0^2)/(3*l);
F = I*(2*b^2 - a^2*(3*mu + 4))/(3*g*l);
Q = -I*(2*a*b*(1+mu))/l;
