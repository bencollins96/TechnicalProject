function [y1] = pfunction_template(t,y,params)

%Action at the Poincare section
y1 = [y(1),params.r*y(2),y(3),y(4),y(5)];
end