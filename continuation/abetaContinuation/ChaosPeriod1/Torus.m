omega = 7.79253414699925;
params = parameters(1);
params = parameters(omega/params.p);

IC = [0.0917887499279652,0.0733954630700953,0.0891418537477012,0.800676196227706,17460.9719686521];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);

figure; hold on;
num = round(0.9*length(y));
plot(y(num:end,1),y(num:end,2))
scatter(poincare(2000:end,1),poincare(2000:end,2))
title('Phase Portrait with poincare crossing');
ylabel('dphi');
xlabel('phi');
savefig('P1TorusPhase.fig');
close


%Messy
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);


figure
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k','MarkerSize',8);
hold on
title('FIrst Return map');
ylabel('Time to impact i +1');
xlabel('Time to impact i');
savefig('TorusFirstReturn.fig');



