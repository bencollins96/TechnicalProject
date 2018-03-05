%TODO: doesnt work for all initial conditions... 
%TODO: how do error tolerances affect results?
%TODO: can have that miss impact if occurs very soon after previous.

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
parameters

ss = -params(4)/params(1);

% Problem IC y0 = [ss,0,0.01,0,0];
% Initial condition
y0 = [ss - 0.5*ss,0,0,0,0];

% Integration time
T = 2; %10 oscillations periods
tspan = [0,T];

% Output is the time, states and events as in Matlab's standard output
[t,y,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,y0,params,C,opts);

plot(t,y(:,1:4))
hold on 
plot(t,beeta*cos(y(:,5)));
legend('phi','dphi','psi','dpsi');
title('Petri linear');
xlabel('Time,t');
ylabel('Angle/Angular velocity');
grid on
