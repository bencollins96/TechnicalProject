%analytic graph
close all 
% r = 1, beeta = 0, a =0.01, b = 1;
params = parameters;

IC = [-0.5*params.P/params.A,0,0,0,0];

[t,y] = analytic_solver(IC,params,4);

figure('pos',[10 10 1200 600]);
subplot(1,2,1);hold on;
plot(y(:,1),y(:,2),'k','LineWidth',2);
ylabel('Block angular velocity, $\dot{\phi}$', 'Interpreter','latex');
xlabel('Block angle, $\phi$', 'Interpreter','latex');
set(gca,'FontSize',16);

subplot(1,2,2);hold on;
plot(y(:,3),y(:,4),'k','LineWidth',2);
ylabel('Pendulum angular velocity, $\dot{\psi}$', 'Interpreter','latex');
xlabel('Pendulum angle, $\psi$', 'Interpreter','latex');
set(gca,'FontSize',16);

savefig('phaseBlock.fig');

