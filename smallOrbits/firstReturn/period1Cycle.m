%9.31350431255660
omega = [7.41200000000000];
params = parameters(omega);
IC = [0.0539558529874381,-0.0252775780268058,0.102297345969927,-0.0273151918007915,75203.4449416325]
[t,y,poincare,impactInd] = numericalSolution(IC,params,600);

% figure('pos',[10 10 900 600]);
% num = round(0.9*length(y));
% h1 = plot(y(:,1),y(:,2),'LineWidth',2); hold on;
% h2 = plot(y(:,3),y(:,4),'LineWidth',2);
% plot(poincare(:,3),poincare(:,4),'.k','MarkerSize',15)
% plot(poincare(:,1),poincare(:,2),'.k','MarkerSize',15)
% ylabel('Angular velocity, $\dot{\phi}$ and $\dot{\psi}$','Interpreter','latex');
% xlabel('Angle, $\phi$ and $\psi$', 'Interpreter','latex');
% legend([h1,h2],{'Block','Pendulum'},'Interpreter','latex');
% set(gca,'FontSize',16);


%Messy
impactTimes = t(impactInd);
impactDifference =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);

%Constant
figure
scatter(impactDifference(2:end-2),impactDifference(3:end-1),'k')
hold on
return 
close  gcf

figure('pos',[10 10 900 600]); hold on;
plot(t,y(:,1:4),'LineWidth',2);
legend('phi','dphi','psi','dpsi');
title('Period 1 Cycle');
xlabel('Time');
ylabel('Angle.Angular Velocity');
savefig('P1.fig');
close all

figure('pos',[10 10 900 600]); hold on;
plot(t,y(:,3),t,y(:,1),'LineWidth',2);
plot(t,cos(params.omega*(t))*max(y(:,1)));
plot(t,cos(params.omega*(t))*max(y(:,3)));



