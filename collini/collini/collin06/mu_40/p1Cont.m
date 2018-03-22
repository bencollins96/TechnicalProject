
IC =[0.0128091178375554,-0.0936932951231882,0.0159376425854931,-0.0710137519429918,74832.7370085089]
% Ic = [1e-9,0,0,0,0]
params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return

paramVec = linspace(1,0.1,100);
[mu_40,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_40)
    scatter(mu_40{i}(:,6),mu_40{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

