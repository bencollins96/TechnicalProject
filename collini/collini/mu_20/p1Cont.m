
IC = [0.0147771151683075,-0.0141864315389499,0.0155801218685242,-0.00925715699125550,41977.9610372668]

% params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return

paramVec = linspace(1,0.05,100);
[mu_20,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_20)
    scatter(mu_20{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

