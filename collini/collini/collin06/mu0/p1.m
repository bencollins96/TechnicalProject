close all
%Initialise Parameters
params = parameters(1);
%Find initial solution without block & Save the initial conditions.
numPeriods = 500;
tSpan = numPeriods*(2*pi/params.omega);

%IC = [0.0225759188938384,-0.0281256111454901,0.0296870547086729,-0.0245492297104814,4919.73409552162];
%[t,y,poincare] = numericalSolutionPendulum([4*10^(-2),0,0,0,0],params,tSpan);
%IC = poincare(end,:);

IC =[0.00521051188964072,-0.00908134955112432,0.00783972453994229,-0.00963019257583355,31378.2274240548]
%IC = [0.000150728476237549,-0.00225971936525932,0.000309289843389321,-0.00388436290333647,12560.0874290520]
[t,y,poincare] = nonlinearSolution1(IC,params,tSpan);
[tn,yn] = numericalSolution(IC,params,tSpan);

figure; hold on;

plot(y(:,1),y(:,2))
plot(y(:,3),y(:,4))
plot(yn(:,1),yn(:,2))
plot(yn(:,3),yn(:,4))

%     
% %plot(y(:,1),y(:,2))
% numIterates = 10;
% aVec = linspace(0.25,0.1,numIterates);
% betaVec= linspace(9.81,0.4,numIterates);
% 
% for i =1:numIterates
%     params = parameters(aVec(i),betaVec(i));
%     [t,y,poincare] = numericalSolution(IC,params,tSpan);
%     IC = poincare(end,:);
%     totalPoincare{i} = poincare(end-11:end,:);
%     IC(5) = mod(IC(5),2*pi);
%     i
% end
% figure; hold on;
% plot(y(:,1),y(:,2))
% plot(y(:,3),y(:,4))
