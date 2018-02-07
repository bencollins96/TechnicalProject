function [y1] = pfunction_template(t,y,params)

%Parameters
r = 0.5;
%Action at the Poincare section
y1 = [y(1),y(2),y(3),y(4),0];