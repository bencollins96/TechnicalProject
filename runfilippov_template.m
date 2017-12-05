% ODE solver
solver = 'ode45';

%ODE-solver options
%Type 'help odeset' in the Matlab window for more details
opts = odeset('RelTol',1e-10,'AbsTol',1e-10,'MaxStep',0.01);

% Name of the file with the two vectorfields
vfields = 'vectorfields';

% Name of the file with the two Jacobianss
jacobians = 'jacobians';

% Name of the file with the two Jacobianss
pfunction = 'pfunction';

% Filippov parameter
C = 1;

% Parameters
params = [];

% Initial condition
y0 = [];

% Integration time
T = ;
tspan = [0,T];

% Output is the time, states and events as in Matlab's standard output
[t,y,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,y0,params,C,opts);
