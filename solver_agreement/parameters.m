%% Params file 

function params= parameters()

params = struct();

%Fundamental Constants:
g = 9.81;           params.g = g;
m = 50;            params.m = m;
M = 100;              params.M = M;
mu = m/M;           params.mu = mu;
a = 0.01;           params.a =a;
b = 1;              params.b = b;
l = 0.75;           params.l = l;
beeta = 0.01;     params.beeta = beeta;
omega = 10;         params.omega = omega;
r = 0.9;            params.r = r;
numImpacts = 10;    params.numImpacts = numImpacts;

%Equation Constants:
r_0 = sqrt(a^2 + b^2);                   params.r_0 = r_0;
r_1 = sqrt(a^2 + 4*b^2);                 params.r_1 = r_1;
I = g/(mu*a^2 + (4/3)*r_0^2);            params.I = I;
J = (M/3)*r_0^2;                         params.J = J;
theta_0 = atan(b/a);                     params.theta_0 = theta_0;
theta_1 = atan(2*b/a);                   params.theta_1 = theta_1;
A = I*b*(1+2*mu);                        params.A = A;
B = -I*2*b*mu;                           params.B = B;
C = I*b/g;                               params.C = C;
P = -I*a*(1+mu);                         params.P = P;
D = (2*I*(b^2)*(1+2*mu))/l;              params.D = D;
E = -I*(3*mu*r_1^2 + 4*r_0^2)/(3*l);     params.E = E;
F = I*(2*b^2 - a^2*(3*mu + 4))/(3*g*l);  params.F = F;
Q = -I*(2*a*b*(1+mu))/l;                 params.Q = Q;

end