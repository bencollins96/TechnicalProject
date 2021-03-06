function [J1,J2,d2H] = jacobians_template(t,y,params,str)

%Parameters

%Jacobian in region S1 (H(x) > 0)
J1 = [0        , 1 ,         0 , 0, 0;...
      params(1), 0 , params(2) , 0, 0;...
      0        , 0 ,         0 , 1, 0;...
      params(5), 0 , params(6) , 0, 0;...
      0        , 0 ,         0 , 0, 0];

%Jacobian in region S2 (H(x) < 0)
J2 = J1;

% (d2/dx2)H(x) - second derivative of H(x)
d2H = zeros(5,5);

 