
IC = [0.0124225733390231,-0.0316238973533393,0.00207677501275060,-0.0919912295701906,49831.9426712413]

params = parameters(1);
% [t,y,poincare] = numericalSolutionDamp(IC,params,500);
% plot(y(:,1),y(:,2));
% return

paramVec = linspace(1,2,50);
[mu_20,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_20)
    scatter(mu_20{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

