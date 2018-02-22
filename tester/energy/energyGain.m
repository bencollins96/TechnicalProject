function deltaE = energyGain(y,params)

a = params.a;
b = params.b;
r = params.r;
M = params.M;
m = params.m;
J = params.J;
r0 = params.r_0;
r1 = params.r_1;
l = params.l;
theta_1 = params.theta_1;

rocking = sign(y(1));
E1 = 0.5*(y(2)^2)*(M*r0^2 + m*r1^2 + J)*(r^2 -1);
%E2 = m*l*y(2)*y(4)*sqrt(4*b^2*(r-1)^2 + a^2*(r+1)^2)*cos(y(3) + atan((a*(r+1))/(2*b*(r-1))));
%E2 = m*l*y(2)*y(4)*(r*r1*sin(theta_1 +rocking*y(3)) - r1*sin(theta_1 - rocking*y(3)));

E2 = r1*m*l*y(2)*y(4)*sin(theta_1 - y(3))*(r-1);
deltaE = E1-E2;



% sqroot = sqrt(4*b^2*(1-r)^2 + a^2*(1+r)^2);
% sqrootcos = sqroot*cos(y(3) - atan((-a*(1 + r))/(2*b*(1-r))));
% 
% deltaE = (y(2)^2/2)*(params.M*params.r_0^2 + params.J + params.m*params.r_1^2)*(1-r^2)...
%          -params.m*params.l*y(2)*y(4)*(2*b*cos(y(3)) - a*sin(y(3)) -r*2*b*cos(y(3)) -r*a*sin(y(3))); %-params.m*params.l*y(2)*y(4)*sqrootcos;


end