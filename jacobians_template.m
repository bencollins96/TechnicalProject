function [J1,J2,d2H] = jacobians_template(t,y,params,str)

%Parameters


%Jacobian in region S1 (H(x) > 0)
J1 = [];

%Jacobian in region S2 (H(x) < 0)
J2 = [];

% (d2/dx2)H(x) - second derivative of H(x)
d2H = [];

