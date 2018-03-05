IC = [0.00192445112886955,-0.230266796122247,0.00587302082265461,-0.619778093266632,1884.95559215388];
params = parameters(0.1);
params = parameters(71.3782344481928/params.p);

[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);

figure('pos',[10 10 900 600]); hold on;
plot(poincare(2000:end,1),poincare(2000:end,2),'.k','MarkerSize',20)
plot(y(200000:end,1),y(200000:end,2),'LineWidth',2)
xlabel('Phi');
ylabel('dphi');
title('Period 5 Orbit');
savefig('P5phase.fig');



impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];

figure('rend','painters','pos',[10 10 900 600]); hold on;
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k','MarkerSize',10)
xlabel('Time to impact i');
ylabel('Time to impact i +1');
title('First return Map');