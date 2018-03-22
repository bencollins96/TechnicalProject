%%mContinuation
close all
clear all 

%Initialise Parameters
params = parameters(0);
ss = -params.P/params.A;
%Find initial solution without block & Save the initial conditions.
numPeriods = 500;
tSpan = numPeriods*(2*pi/params.omega);
[t,y,poincare] = numericalSolutionNoPendulum([4*10^(-2),0,0,0,0],params,tSpan);
IC = poincare(end,:);

numIterates = 140;
paramVec = linspace(1e-8,0.25,numIterates);

[totalPoincare] = continuation(IC,paramVec,numPeriods);

figure; hold on;
for i =1:length(totalPoincare)
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'.k','MarkerSize',10);
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,2),'.b','MarkerSize',10);
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,3),'.r','MarkerSize',10);
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,4),'.g','MarkerSize',10);
    i
end

h1 = plot(paramVec(1),totalPoincare{1}(1,1),'.k','MarkerSize',10);
h2 = plot(paramVec(1),totalPoincare{1}(1,2),'.b','MarkerSize',10);
h3 = plot(paramVec(1),totalPoincare{1}(1,3),'.r','MarkerSize',10);
h4 = plot(paramVec(1),totalPoincare{1}(1,4),'.g','MarkerSize',10);

title('Pendulum and Block variables at Maximum Forcing');
xlabel('mu');
ylabel('Angle / angular velocity');
legend([h1;h2;h3;h4],{'phi','dphi','psi','dpsi'},'Location','southeast');
