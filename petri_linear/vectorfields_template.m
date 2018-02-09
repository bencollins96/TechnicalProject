function [F1,F2,H,dH,h,hdir] = vectorfields_template(t,y,params,str)

%TODO: weird fix: add a very small vector to dH.
%TODO: disconitunuity surface is the same as pfunction thing...
% is this the reason that matlab doesnt like it.

%Parameters

parameters

phi  = y(1);
dphi = y(2);
psi  = y(3);
dpsi = y(4);

%Vector field in region S1 (H > 0)
forcing = params(9)*cos(params(10)*t);
dx1 = dphi;
dx2 = params(1)*phi + params(2)*psi + params(3)*forcing + params(4);
dx3 = dpsi;
dx4 = params(5)*phi + params(6)*psi + params(7)*forcing + params(8);
 
F1 = [dx1;dx2;dx3;dx4];

% Vector field in region S2 (H < 0)
forcing = params(9)*cos(params(10)*t);
dx1 = dphi;
dx2 = params(1)*phi + params(2)*psi + params(3)*forcing - params(4);
dx3 = dpsi;
dx4 = params(5)*phi + params(6)*psi + params(7)*forcing - params(8);
 
F2 = [dx1;dx2;dx3;dx4];


% Function defining the discontinuity surface (H = 0)
H = phi;

% The vector normal to the switching manifold dH = grad(H);
dH =[1,eps,eps,eps]; %Something to do with this! Add an eps..

% Poincare section
h =0; 

% Direction of location for Poincare section
hdir = 1;
