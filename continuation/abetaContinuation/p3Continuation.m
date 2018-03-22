%%mContinuation
close all
clear all 

%Initialise Parameters
params = parameters(0,0);
ss = -params.P/params.A;
%Find initial solution without block & Save the initial conditions.
numPeriods = 500;
tSpan = numPeriods*(2*pi/params.omega);
params = parameters(0.25,4);
IC = [0.0531244969622656,0.262870105312190,0.133480247424125,1.07576199496888,23291.7679337147];


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

% figure; hold on;
% for i =1:length(totalPoincare)
%     plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'.k','MarkerSize',10);
%     plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,2),'.b','MarkerSize',10);
%     plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,3),'.r','MarkerSize',10);
%     plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,4),'.g','MarkerSize',10);
%     i
% end
% 
% h1 = plot(paramVec(1),totalPoincare{1}(1,1),'.k','MarkerSize',10);
% h2 = plot(paramVec(1),totalPoincare{1}(1,2),'.b','MarkerSize',10);
% h3 = plot(paramVec(1),totalPoincare{1}(1,3),'.r','MarkerSize',10);
% h4 = plot(paramVec(1),totalPoincare{1}(1,4),'.g','MarkerSize',10);
% 
% title('Pendulum and Block variables at Maximum Forcing');
% xlabel('mu');
% ylabel('Angle / angular velocity');
% legend([h1;h2;h3;h4],{'phi','dphi','psi','dpsi'},'Location','southeast');
