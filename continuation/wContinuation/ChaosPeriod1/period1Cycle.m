%9.31350431255660
omega = [20.31350431255660];
params = parameters(1);
params = parameters(omega/params.p);

IC = [[0.0225768561235954,-0.0281217028224450,0.0296741306507371,-0.0245805700726008,2029.46885421901]];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1);

figure('rend','painters','pos',[10 10 900 600]);
num = round(0.9*length(y));
plot(y(:,1),y(:,2)); hold on;
plot(poincare(:,1),poincare(:,2),'.k','MarkerSize',10)
ylabel('dphi');
xlabel('phi');
title('Phase portrait with poincare crossings');
savefig('P1Cycle.fig');
close

%Messy
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);

%Constant
figure;
scatter(impactDifference(2:end-2),impactDifference(3:end-1),'k')
hold on
close  gcf

figure('rend','painters','pos',[10 10 900 600]); hold on;
plot(t,y(:,1:4),'LineWidth',2);
legend('phi','dphi','psi','dpsi');
title('Period 1 Cycle');
xlabel('Time');
ylabel('Angle.Angular Velocity');
savefig('P1.fig');
close all

figure('rend','painters','pos',[10 10 900 600]); hold on;
plot(t,y(:,3),t,y(:,1),'LineWidth',2);
plot(t,cos(params.omega*(t))*max(y(:,1)));
plot(t,cos(params.omega*(t))*max(y(:,3)));




