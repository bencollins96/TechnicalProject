

%l = 0.75
IC = [0.0135546850508426,-0.0147634292069343,0.000252096324390086,-0.0333564149442499,21972.2990192070];
figure; hold on
params = parameters(1);
% [t,y,poincare] = numericalSolutionDamp(IC,params,500);
% plot(y(:,1),y(:,2));
% plot(y(:,3),y(:,4));
% return


paramVec = linspace(1,2,50);
[mu_10,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

