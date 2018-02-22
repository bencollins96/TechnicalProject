%TODO: sometimes stops prematurely and gives NaNs (Gets through the impact
%then same two values and then NaN's , always one same initial one.. I
%think it is something to do with escaping to infinity...
%very much hope not error in maths...
%
%TODO:often get integration failure... presumably with nans - need to check
%for this.
%TODO: check for too many impacts. Can fail as impacts get closer and
%closer then escape to infinity... but undetected..... maybe check time
%between impacts is greater than max step?

function [tTotal,yTotal] = runfilippov(y0,params,tSpan)

% ODE solver
solver = 'ode45';

%ODE-solver options
%Type 'help odeset' in the Matlab window for more details
opts = odeset('RelTol',1e-10,'AbsTol',1e-10,'MaxStep',0.01);

% Name of the file with the two vectorfields
vfields = 'vectorfields_template';

% Name of the file with the two Jacobians
jacobians = 'jacobians_template';

% Name of the file with the two Jacobians
pfunction = 'pfunction_template';

% Filippov parameter
C = 1;

% Integration time
%T = 60*(2*pi/omega); %10 oscillations periods
tspan = [0,tSpan];


% Output is the time, states and events as in Matlab's standard output
[tTotal,yTotal,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,params,y0,C,opts);

end
