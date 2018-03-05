IC = [0.0531244969622656,0.262870105312190,0.133480247424125,1.07576199496888,23291.7679337147];
params = parameters(3);


[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);

figure('pos',[10 10 900 600]); hold on;
plot(poincare(2000:end,1),poincare(2000:end,2),'.k','MarkerSize',20)
plot(y(200000:end,1),y(200000:end,2),'LineWidth',2)
xlabel('Phi');
ylabel('dphi');
title('Period 3 Orbit');



impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];

figure('rend','painters','pos',[10 10 900 600]); hold on;
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k','MarkerSize',10)
xlabel('Time to impact i');
ylabel('Time to impact i +1');
title('First return Map');