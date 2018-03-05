function [F1,F2,H,dH,h,hdir] = vectorfields_template(t,y,params,str)

%TODO: weird fix: add a very small vector to dH.
%TODO: disconitunuity surface is the same as pfunction thing...
% is this the reason that matlab doesnt like it.
%TODO: solver stops early sometimes without warning...

phi  = y(1);
dphi = y(2);
psi  = y(3);
dpsi = y(4);
time = y(5);

%Vector field in region S1 (H > 0)
forcing = -params.beeta*params.omega^2*cos(time);
dx1 = dphi;
dx2 = params.A*phi + params.B*psi + params.C*forcing + params.P;
dx3 = dpsi;
dx4 = params.D*phi + params.E*psi + params.F*forcing + params.Q;
dx5 = params.omega;
F1 = [dx1;dx2;dx3;dx4;dx5];

% Vector field in region S2 (H < 0)
forcing = -params.beeta*params.omega^2*cos(time);
dx1 = dphi;
dx2 = params.A*phi + params.B*psi + params.C*forcing - params.P;
dx3 = dpsi;
dx4 = params.D*phi + params.E*psi + params.F*forcing - params.Q;
dx5 = params.omega;
F2 = [dx1;dx2;dx3;dx4;dx5];


% Function defining the discontinuity surface (H = 0)
H = phi;

% The vector normal to the switching manifold dH = grad(H);
dH =[1,eps,eps,eps,0]; %Something to do with this! Add an eps..

% Poincare section
h = mod(dx5, 2*pi);

% Direction of location for Poincare section
hdir = 1;
