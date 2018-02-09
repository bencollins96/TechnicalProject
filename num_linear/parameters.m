%% Params file 

%Fundamental Constants:
g = 9.81;
mu = 0.5;
a =0.001;
b = 1;
l = 0.5;
beta = 0.001;
omega = 10;

%Equation Constants:
r0 = sqrt(a^2 + b^2);
r1 = sqrt(a^2 + 4*b^2);
I = g/(mu*a^2 + (4/3)*r0^2);

A = b*(1+2*mu);
B = -2*b*mu;
C = b/g;
P = -a*(1+mu);

D = (2*(b^2)*(1+2*mu))/l;
E = -(3*mu*r1^2 + 4*r0^2)/(3*l);
F = (2*b^2 - a^2*(3*mu + 4))/(3*g*l);
Q = -(2*a*b*(1+mu))/l;

constants = I.*[A,B,C,P,D,E,F,Q];
params = [constants,beta,omega];