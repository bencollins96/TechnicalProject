
%l = 0.75
IC = [0.0144653094454846,-0.0131780437032791,0.0146242772116769,-0.00773232121749864,15707.9632679490];
params = parameters(1);

% [t,y,poincare] = numericalSolution(IC,params,500);
% figure
% plot(y(:,1),y(:,2));

paramVec = linspace(1,0.05,100);
[mu_5,maxBlock] = continuation(IC,paramVec,500);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

