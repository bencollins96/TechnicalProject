function [F1,F2,H,dH,h,hdir] = vectorfields_template(t,y,params,str)

%Parameters
F = params(1);
w = params(2);

%Vector field in region S1 (H > 0)
F1 = [y(2);...
      -y(1) + sin(y(3)) - F;...
      w];

% Vector field in region S2 (H < 0)
F2 = [y(2); ...
      -y(1) + sin(y(3)) + F; ...
      w];

% Function defining the discontinuity surface (H = 0)
H = y(2);

% The vector normal to the switching manifold dH = grad(H);
dH =[0,1,0];

% Poincare section
h = y(3) - 2*pi ; 

% Direction of location for Poincare section
hdir = 1;
