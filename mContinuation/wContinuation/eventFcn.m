function [value, isTerminal, direction] = eventFcn(t,y)

%Detect block impact.
value(1) = y(1);

%Detect crossing poincare section: max forcing
value(2) = mod(y(5),2*pi)- pi;

%Stop if impact but not on crossing poincare
isTerminal = [1,0];
direction  = [0,-1];

end

