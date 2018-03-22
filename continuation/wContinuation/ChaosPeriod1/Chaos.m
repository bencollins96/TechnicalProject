close all
clear all
params = parameters(1);
omega = 7.72200/params.p;
params = parameters(omega);
paramVec = omega;% linspace(omega,omega - 0.005,5);
%paramVec = paramVec(1);
IC =[0.128129682680944,0.0870245072077756,0.369285861209354,1.18324365662893,273054.667079410];
ICs = [];
for i =1:length(paramVec)
    params = parameters(paramVec(i));
    [t,y,poincare,impactInd] = numericalSolutionImp(IC,params,2000);
    IC = poincare(end,:);
    ICs =[ICs;IC];
    i
end


figure('pos',[10 10 900 600]); hold on;
num = round(0.9*length(y));
plot(y(num:end,1),y(num:end,2))
scatter(poincare(2000:end,1),poincare(2000:end,2))
xlabel('$\phi$','Interpreter','latex');
ylabel('$\dot{\phi}$','Interpreter','latex');
set(gca,'FontSize',16);
savefig('P1ChaosPortrait.fig');
close 
%Messy
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);

figure('pos',[10 10 900 600]); hold on;
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k','MarkerSize',8)
hold on
xlabel('Time to impact i','Interpreter','latex');
ylabel('Time to impact i+1','Interpreter','latex');
set(gca,'FontSize',16);
savefig('P1ChaosFirstReturn.fig');



