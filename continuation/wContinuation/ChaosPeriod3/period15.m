params = parameters(2.512820512820519);
IC = [0.0492451534526617,0.393746100996271,0.0925543311643631,1.74848631754987,19810.8832735372];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);
figure; hold on;


scatter(poincare(2000:end,1),poincare(2000:end,2))
plot(y(200000:end,1),y(200000:end,2))
xlabel('Phi');
ylabel('dphi');
title('Asymmetric Period 15 Orbit');
savefig('P15Orbit.fig');
close 

impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];

figure
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k','MarkerSize',10)
xlabel('Time to impact i');
ylabel('Time to impact i +1');
title('First return Map');
savefig('P15FirstReturn.fig');
