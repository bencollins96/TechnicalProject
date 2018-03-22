
IC = [0.0151264422460471,-0.0149564813942651,0.0163149000836531,-0.0102971635231241,54481.4997985542]

% params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return
paramVec = linspace(1,0.1,100);
[mu_30,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_30)
    scatter(mu_30{i}(:,6),mu_30{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

