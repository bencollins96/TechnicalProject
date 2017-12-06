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

% Parameters
params = [0.4,0.5];

% Initial condition
y0 = [1,2,0];

% Integration time
T = 10*2*pi/params(2); %10 oscillations periods
tspan = [0,T];

% Output is the time, states and events as in Matlab's standard output
[t,y,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,y0,params,C,opts);
