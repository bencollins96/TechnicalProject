function dx = rockingBlockEq(t,x,params)

rocking = sign(x(1));
    
%Time for forcing, autonomous equations: extra variable.
forcingTime = x(5);

forcing = -params.beeta*params.omega^2*cos(forcingTime);
dx1 = x(2);
dx2 = params.A*x(1) + params.B*x(3) + params.C*forcing + rocking*params.P;
dx3 = x(4);
dx4 = params.D*x(1) + params.E*x(3) + params.F*forcing + rocking*params.Q;
dx5 = params.omega;

dx = [dx1;dx2;dx3;dx4;dx5];
end