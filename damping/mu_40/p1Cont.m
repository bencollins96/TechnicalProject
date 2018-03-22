
IC =[0.0117432491279427,-0.0510431727179635,0.00366134556958384,-0.127669989623744,74832.7370085089]
params = parameters(1);

% figure; hold on;
% [t,y,poincare] = numericalSolutionDamp(IC,params,500);
% plot(y(:,1),y(:,2));
% plot(y(:,3),y(:,4));
% return

paramVec = linspace(1,2,50);
[mu_40,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_40)
    scatter(mu_40{i}(:,6),mu_40{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

