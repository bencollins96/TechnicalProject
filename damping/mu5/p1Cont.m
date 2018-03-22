
%l = 0.75
IC = [0.0144653094457170,-0.0131780437064267,0.0146242772084616,-0.00773232118829718,14118.3173852325];
params = parameters(1);

% [t,y,poincare] = numericalSolutionDamp(IC,params,500);
% figure; hold on
% plot(y(:,1),y(:,2));
% plot(y(:,3),y(:,4));
% return

paramVec = linspace(1,2,50);
[mu_5,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

