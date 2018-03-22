%9.31350431255660
omega = [20.31350431255660];
params = parameters(1);
params = parameters(omega/params.p);

IC = [0.0225759188938384,-0.0281256111454901,0.0296870547086729,-0.0245492297104814,4919.73409552162];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,100);

figure('pos',[10 10 900 600]);
num = round(0.9*length(y));
h1 = plot(y(:,1),y(:,2),'LineWidth',2); hold on;
h2 = plot(y(:,3),y(:,4),'LineWidth',2);
plot(poincare(:,3),poincare(:,4),'.k','MarkerSize',15)
plot(poincare(:,1),poincare(:,2),'.k','MarkerSize',15)
ylabel('Angular velocity, $\dot{\phi}$ and $\dot{\psi}$','Interpreter','latex');
xlabel('Angle, $\phi$ and $\psi$', 'Interpreter','latex');
legend([h1,h2],{'Block','Pendulum'},'Interpreter','latex');
set(gca,'FontSize',16);

return

%Messy
impactTimes = t(impactInd);
impactDifference =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);

%Constant
figure;
scatter(impactDifference(2:end-2),impactDifference(3:end-1),'k')
hold on
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





