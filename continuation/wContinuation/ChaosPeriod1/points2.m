omega =[8.0337433530655];
params = parameters(1);
params = parameters(omega/params.p);

IC =[[0.135565540307406,-0.0593620937074702,0.201582712428095,-0.0481469499493524,50083.2700835285]];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,2000);

% figure; hold on;
% num = round(0.9*length(y));
% plot(y(num:end,1),y(num:end,2))
% scatter(poincare(2000:end,1),poincare(2000:end,2))
% title('Phase Portrait with poincare crossing');
% ylabel('dphi');
% xlabel('phi');
% savefig('P1TorusPhase.fig');
% close


%Messy
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);


plot(impactDifference(2:end-2),impactDifference(3:end-1),'.g','MarkerSize',8);
hold on
title('FIrst Return map');
ylabel('Time to impact i +1');
xlabel('Time to impact i');




