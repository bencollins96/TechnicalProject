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

function [tTotal,yTotal,te,ye,ie,se] = runfilippov(y0,params)

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

% Parameters: params =[A,B,C,P,D,E,F,Q,beta,omega];
ss = -params.P/params.A;

% Problem IC y0 = [ss,0,0.01,0,0];
% Initial condition
%y0 = [0.5*ss,0,0,0,0];

% Integration time
T = 200*(2*pi/params.omega); %10 oscillations periods
tspan = [0,T];


% Output is the time, states and events as in Matlab's standard output
[tTotal,yTotal,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,params,y0,C,opts);

end
