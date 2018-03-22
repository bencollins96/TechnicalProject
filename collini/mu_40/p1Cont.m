
IC =[0.00540520316749492,-0.00991077004375585,0.00625009430174589,-0.00835896653086267,59124.7737405599]

% params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return
paramVec = linspace(1,0.05,100);
[mu_40,maxBlock] = continuation(IC,paramVec,500);

figure
hold on
for i =1:length(mu_40)
    scatter(mu_40{i}(:,6),mu_40{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

