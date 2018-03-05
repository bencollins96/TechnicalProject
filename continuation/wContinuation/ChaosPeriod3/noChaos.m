omega = 17.7703145141713741;
params = parameters(omega);
params = parameters(omega/params.p);
%Messy one. It looks like it is ever so slowly circling in to the other. 
%IC = [0.078268466133270   0.223906160520014   0.238183504964078 1.134374977654930 1.535924648340050e+05];
%IC = [0.0786999344457745,0.225568867866673,0.402887517322702,2.04130794814183,3700.79614592878];

%Almost Chaotic cycles in poincare.
IC = [1e-9,0,0,0,2];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);

figure; hold on;
num = round(0.9*length(y));
plot(y(num:end,1),y(num:end,2))
scatter(poincare(2000:end,1),poincare(2000:end,2))
title('Phase Portait with Poincare crossings');
xlabel('phi');
ylabel('dphi');


%Messy
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);

figure; hold on;
scatter(impactDifference(2:end-2),impactDifference(3:end-1),'k')
title('First Return Map');
xlabel('Time to impact i');
ylabel('Time to impact i+1');