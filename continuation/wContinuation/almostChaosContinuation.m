%Chaos continued
close all 
params = parameters(0);
omega = 17.823145141713741/params.p;
params = parameters(omega);

paramVec = linspace(omega,omega-0.005,10);
paramVec = paramVec(end)
%Same two just further on
IC = [-0.0711559173608701,0.187931800751237,-0.404070704040282,0.880069491788736,42914.1556480366];
IC = [0.101017336119296,0.262350504663327,0.385172625908325,1.22608404117792,128459.723605287];

%So close to chaos -> COuld it be?
IC = [0.0826360259468727,-0.377665225779934,0.314939140569739,-1.33425469073525,146241.138024605];
total = cell(length(paramVec),4);

for i  = 1:length(paramVec)
    params = parameters(paramVec(i));
    [t,y,poincare,impactInd] = numericalSolutionImp(IC,params,4800);
    total{i,1} = t;
    total{i,2} = y;
    total{i,3} = poincare;
    total{i,4} = impactInd;
end

figure
plot(y(:,1),y(:,2));

% figure; hold on;
% for i =1:length(totalPoinca)
%     scatter(paramVec(i)*ones(12,1),totalPoincare{i,3}(:,1),'k','filled');
% end

impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];

figure
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k')
hold on