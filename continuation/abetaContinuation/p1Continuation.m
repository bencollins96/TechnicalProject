%%mContinuation
close all
clear all 

%Initialise Parameters
params = parameters(0,0);
ss = -params.P/params.A;
%Find initial solution without block & Save the initial conditions.
numPeriods = 500;
tSpan = numPeriods*(2*pi/params.omega);
params = parameters(0.25,9.81);
IC = [0.0225759188938384,-0.0281256111454901,0.0296870547086729,-0.0245492297104814,4919.73409552162];
%[t,y,poincare] = numericalSolutionPendulum([4*10^(-2),0,0,0,0],params,tSpan);
%IC = poincare(end,:);
    
%plot(y(:,1),y(:,2))
numIterates = 10;
aVec = linspace(0.25,0.1,numIterates);
betaVec= linspace(9.81,0.4,numIterates);

for i =1:numIterates
    params = parameters(aVec(i),betaVec(i));
    [t,y,poincare] = numericalSolution(IC,params,tSpan);
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
