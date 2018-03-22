%% Big torus
omega = 7.77;
params = parameters(1);
params = parameters(omega/params.p);

IC = [0.139834843530616  -0.016960185300522   0.406180387522976   0.414071779834218,     4.077787264359551e+04];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k','MarkerSize',8);

plot(y(:,1),y(:,2));
