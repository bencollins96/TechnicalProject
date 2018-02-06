function [F1,F2,H,dH,h,hdir] = vectorfields_template(t,y,params,str)

%Parameters

%Vector field in region S1 (H > 0)
F1 = [y(2); ...
      params(1)*y(1) + params(2)*y(3) + params(4) ; ...
      y(4);...
      params(5)*y(1) + params(6)*y(3) + params(8)];

% Vector field in region S2 (H < 0)
F2 = [y(2); ...
      params(1)*y(1) + params(2)*y(3) - params(4) ; ...
      y(4);...
      params(5)*y(1) + params(6)*y(3) - params(8)];

% Function defining the discontinuity surface (H = 0)
H = y(1);

% The vector normal to the switching manifold dH = grad(H);
dH =[1,0,0,0];

% Poincare section
h = y(1); 

% Direction of location for Poincare section
hdir = 1;
