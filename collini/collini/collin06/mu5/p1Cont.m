
%l = 0.75
IC = [0.0123358800625183,-0.0782404190906138,0.0139235123439285,-0.0478513066744064,23561.9449019234];
params = parameters(1);

% [t,y,poincare] = numericalSolution(IC,params,500);
% figure
% plot(y(:,1),y(:,2));
% return

paramVec = linspace(1,0.05,100);
[mu_5,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

