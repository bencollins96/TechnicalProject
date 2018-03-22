

%l = 0.75
IC = [0.0144316083054203,-0.0134431974648416,0.0148535055258698,-0.00826841586139392,29644.0682792733]


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

