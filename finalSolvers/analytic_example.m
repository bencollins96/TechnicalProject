%analytic graph

% r = 1, beeta = 0, a =0.01, b = 1;
params = parameters;

IC = [-0.5*params.P/params.A,0,0,0,0];

[t,y] = analytic_solver(IC,params,2);

figure('rend','painters','pos',[10 10 900 600]);
subplot(2,1,1);hold on;grid on;
plot(t,y(:,1),'k','LineWidth',2);
plot(t,y(:,2),'b','LineWidth',2);
ylabel('Angle');
title('The Block, phi, dphi');
legend('phi','dphi','Location','southeast');

subplot(2,1,2);hold on;grid on;
plot(t,y(:,3),'k','LineWidth',2);
plot(t,y(:,4),'b','LineWidth',2);
ylabel('Angle');
xlabel('Time');
title('The pendulum, psi, dpsi');
legend('psi','dpsi','Location','southeast');

