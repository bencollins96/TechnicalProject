
IC = [0.00526680105365903,-0.00932861202895281,0.00596585260175295,-0.00752660446766888,46627.5181645797];

% params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return
paramVec = linspace(1,0.05,100);
[mu_30,maxBlock] = continuation(IC,paramVec,500);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

