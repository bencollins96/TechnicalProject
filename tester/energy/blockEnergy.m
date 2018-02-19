%% To visualise the energy of the system.
close all 
clear all

params = parameters;
IC = [-0.5*params.P/params.A,0,0,0,0];
tSpan = 2;
[tLinear,yLinear] = numericalSolution(IC,params,tSpan);
[tNonlin,yNonlin] = nonlinearSolution(IC,params,tSpan);

linearEnergy = energy(tLinear,yLinear,params);
nonlinEnergy = energy(tNonlin,yNonlin,params);

%Start Simulation just before impact.
IC = yLinear(395,:);
[tBefore,yBefore] = numericalSolution(IC,params,tSpan);
eBefore = energy(tBefore,yBefore,params);
tBefore = tBefore + tLinear(395);

figure 
subplot(2,2,1)
plot(tLinear,linearEnergy(:,1));
hold on
plot(tNonlin,nonlinEnergy(:,1));
title('Kinetic Block');

subplot(2,2,2)
plot(tLinear,linearEnergy(:,2));
hold on
plot(tNonlin,nonlinEnergy(:,2));
title('Kinetic Pendulum');

subplot(2,2,3)
plot(tLinear,linearEnergy(:,3));
hold on
plot(tNonlin,nonlinEnergy(:,3));
title('Potential Block');

subplot(2,2,4)
plot(tLinear,linearEnergy(:,4));
hold on
plot(tNonlin,nonlinEnergy(:,4));
title('Potential Pendulum');

figure
subplot(2,1,1)
plot(tLinear,yLinear(:,1:4),'k','DisplayName','t0=0');
hold on
plot(tBefore,yBefore(:,1:4),'b','DisplayName','t0= just before impact');
legend('show');
title('Dynamics');

subplot(2,1,2)
plot(tLinear,sum(linearEnergy,2),'k');
hold on 
plot(tBefore,sum(eBefore,2),'b');
legend('t0=0','t0= just before impact');
title('Energy');



