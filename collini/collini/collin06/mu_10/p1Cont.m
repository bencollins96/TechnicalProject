

%l = 0.75
IC = [0.0122385278257374,-0.0798146323697680,0.0140905979669629,-0.0512152214071313,37498.0499132478];


% params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return

paramVec = linspace(1,0.1,100);
[mu_10,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

