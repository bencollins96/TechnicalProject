
IC = [0.0531244969622656,0.262870105312190,0.133480247424125,1.07576199496888,23291.7679337147];
params = parameters(3);


[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);

% figure('pos',[10 10 900 600]); hold on;
% plot(poincare(2000:end,1),poincare(2000:end,2),'.k','MarkerSize',20)
% plot(y(200000:end,1),y(200000:end,2),'LineWidth',2)
% plot(poincare(2000:end,3),poincare(2000:end,4),'.k','MarkerSize',20)
% plot(y(200000:end,3),y(200000:end,4),'LineWidth',2)
% xlabel('Phi');
% ylabel('dphi');

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
figure('pos',[10 10 900 600]); hold on;
plot(poincare(2000:end,3),poincare(2000:end,4),'.k','MarkerSize',20)
plot(y(200000:end,3),y(200000:end,4),'LineWidth',2)
xlabel('Psi');
ylabel('dpsi');
title('Period 3 Orbit');

return

impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];

figure('rend','painters','pos',[10 10 900 600]); hold on;
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k','MarkerSize',10)
xlabel('Time to impact i');
ylabel('Time to impact i +1');
title('First return Map');