
IC = [0.0124330260319454,-0.0842646893356605,0.0147081745740914,-0.0574634437451266,49831.9426712413]

% params = parameters(1);
% [t,y,poincare] = numericalSolution(IC,params,500);
% plot(y(:,1),y(:,2));
% return

paramVec = linspace(1,0.1,100);
[mu_20,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_20)
    scatter(mu_20{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

