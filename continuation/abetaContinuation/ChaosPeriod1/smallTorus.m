omega =[7.93036797903714];
params = parameters(1);
params = parameters(omega/params.p);

IC =[0.103598767061860,-0.0973816565212259,0.155098922288359,-0.258433506625162,81178.7541687603];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,2000);

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
title('First Return map');
ylabel('Time to impact i +1');
xlabel('Time to impact i');
savefig('TorusFirstReturn.fig');

figure('pos',[10 10 900 600]);
plot3(y(480000:end,1),y(480000:end,3),y(480000:end,4));
xlabel('phi');
ylabel('psi');
zlabel('dpsi');
view(-64.3,-5.2);
savefig('literalTorus.fig');




