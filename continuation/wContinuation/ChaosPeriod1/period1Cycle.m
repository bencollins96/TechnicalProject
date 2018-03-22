%9.31350431255660
omega = [20.31350431255660];
params = parameters(1);
params = parameters(omega/params.p);

IC  = [0.0232221882759866,-0.0302420186058546,0.0314861581532951,-0.0285551688230447,6949.20294974062]
ICp = [0.0223330298145114,-0.0276567639424843,0,0,0];


ICp = [0.0228144454964706,-0.0294072177046240,0,0,8124.15860218320];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,100);
[tp,yp,poincarep,impactIndp] = numericalSolutionNoPend(ICp,params,400);


figure('pos',[10 10 900 600]);
num = round(0.9*length(y));
h1 = plot(y(:,1),y(:,2),'LineWidth',2); hold on;
h2 = plot(y(:,3),y(:,4),'LineWidth',2);
h3 = plot(yp(:,1),yp(:,2),'LineWidth',2);

plot(poincarep(:,1),poincarep(:,2),'.k','MarkerSize',15);
plot(poincare(:,3),poincare(:,4),'.k','MarkerSize',15)
plot(poincare(:,1),poincare(:,2),'.k','MarkerSize',15)
ylabel('Angular velocity, $\dot{\phi}$ and $\dot{\psi}$','Interpreter','latex');
xlabel('Angle, $\phi$ and $\psi$', 'Interpreter','latex');
legend([h1,h2,h3],{'Block','Pendulum','Block alone'},'Interpreter','latex');
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





