function [value, isTerminal, direction] = eventFcn(~,y)

%Detect block impact.
value(1) = y(1);

%Stop if impact but not on crossing poincare
isTerminal = 1;
direction  = 0;

end

