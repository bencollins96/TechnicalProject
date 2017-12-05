function [F1,F2,H,dH,h,hdir] = vectorfields_template(t,y,params,str)

%Parameters

%Vector field in region S1 (H > 0)
F1 = [;...
      ;...
      ];

% Vector field in region S2 (H < 0)
F2 = [; ...
      ; ...
      ];

% Function defining the discontinuity surface (H = 0)
H = ;

% The vector normal to the switching manifold dH = grad(H);
dH = ;

% Poincare section
h = ; 

% Direction of location for Poincare section
hdir = 1;
