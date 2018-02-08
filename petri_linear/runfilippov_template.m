%TODO: doesnt work for all initial conditions... 
%TODO: sometimes stops prematurely and gives NaNs (Gets through the impact
%then same two values and then NaN's , always one same initial one.. I
%think it is something to do with escaping to infinity...
%very much hope not error in maths...
%
%TODO: sometimes it gives horzcat errors in ODE45 (FIXED by eps)

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

% Parameters : params = [A,B,C,P,D,E,F,Q,beta,omega];
parameters

ss = -params(4)/params(1);

% Problem IC y0 = [ss,0,0.01,0,0];
% Initial condition
y0 = [ss-0.001,0,0,0,0];

% Integration time
T = 10; %10 oscillations periods
tspan = [0,T];

% Output is the time, states and events as in Matlab's standard output
[t,y,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,y0,params,C,opts);
