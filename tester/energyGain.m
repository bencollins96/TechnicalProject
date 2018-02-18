function deltaE = energyGain(y)

params = parameters;
a = params.a;
b = params.b;
r = params.r;

sqroot = sqrt(4*b^2*(1-r)^2 + a^2*(1+r)^2);
sqrootcos = sqroot*cos(y(3) - atan((-a*(1 + r))/(2*b*(1-r))));

deltaE = (y(2)^2/2)*(params.M*params.r_0^2 + params.J + params.m*params.r_1^2)*(1-r^2)...
         -params.m*params.l*y(2)*y(4)*(2*b*cos(y(3)) - a*sin(y(3)) -r*2*b*cos(y(3)) -r*a*sin(y(3))); %-params.m*params.l*y(2)*y(4)*sqrootcos;


end