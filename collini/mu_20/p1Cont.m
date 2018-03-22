
IC = [0.00512875311655393,-0.00876578390462470,0.00568242323512067,-0.00673284100360909,34130.2625885995]

% params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return

paramVec = linspace(1,0.05,100);
[mu_20,maxBlock] = continuation(IC,paramVec,500);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

