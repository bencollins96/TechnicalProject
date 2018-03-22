
IC = [0.0119258961314361,-0.0419784690969891,0.00298745928153598,-0.112172770012084,62335.4814325287];

% params = parameters(1);
% [t,y,poincare] = numericalSolutionDamp(IC,params,500);
% plot(y(:,1),y(:,2));
% hold on
% plot(y(:,3),y(:,4));
% return

paramVec = linspace(1,2,50);
[mu_30,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_30)
    scatter(mu_30{i}(:,6),mu_30{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

