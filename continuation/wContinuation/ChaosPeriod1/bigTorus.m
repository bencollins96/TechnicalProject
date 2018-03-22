%%big torus 
%% Big torus
omega = 7.76;
params = parameters(1);
params = parameters(omega/params.p);

IC = [ 0.071660089917242   0.048963956577480   0.032721507735450   0.628319475030054    5.629734035232908e+04];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,5000);
impactTimes = t(impactInd);
impactDifferenceB  =  [impactTimes;0] - [0;impactTimes];
impactDifferenceB = impactDifferenceB*(2*pi/params.omega);
plot(impactDifferenceB(2:end-2),impactDifferenceB(3:end-1),'.k','MarkerSize',8);


