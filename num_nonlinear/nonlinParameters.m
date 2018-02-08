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
I = g/(mu*a^2 + (4/3)*r_0^2);
J = (M/3)*r_0^2;

fddot = 0;

theta_1 = atan(2*b/a);
theta_0 = atan(b/a);


A = b*(1+2*mu);
B = -2*b*mu;
C = b/g;
P = -a*(1+mu);

D = (2*(b^2)*(1+2*mu))/l;
E = -(3*mu*r_1^2 + 4*r_0^2)/(3*l);
F = (2*b^2 - a^2*(3*mu + 4))/(3*g*l);
Q = -(2*a*b*(1+mu))/l;

constants = I.*[A,B,C,P,D,E,F,Q];
params = [constants,beta,omega];