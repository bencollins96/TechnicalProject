%%mContinuation
close all
clear all 

%Initialise Parameters
params = parameters();
ss = -params.P/params.A;
%Find initial solution without block & Save the initial conditions.
numPeriods = 500;
tSpan = numPeriods*(2*pi/params.omega);
IC = [0.00182877105548057,-0.153174857238068,0.00680982253158409,-0.445465763732578,126832.378610727]
[t,y,poincare] = numericalSolution(IC,params,tSpan);
[tp,yp,poincare] = nonlinearSolution1(IC,params,tSpan);

figure; hold on;
plot(y(:,1),y(:,2))
plot(y(:,3),y(:,4))

plot(yp(:,1),yp(:,2))
plot(yp(:,3),yp(:,4))

return

numIterates = 10;
aVec = linspace(0.25,0.1,numIterates);
betaVec= linspace(9.81,0.4,numIterates);

for i =1:numIterates
    params = parameters(aVec(i),betaVec(i));
    [t,y,poincare] = numericalSolution(IC,params,tSpan);
    figure; hold on;
plot(y(:,1),y(:,2))
plot(y(:,3),y(:,4))
return
    IC = poincare(end,:);
    totalPoincare{i} = poincare(end-11:end,:);
    IC(5) = mod(IC(5),2*pi);
    i
end
figure; hold on;
plot(y(:,1),y(:,2))
plot(y(:,3),y(:,4))

