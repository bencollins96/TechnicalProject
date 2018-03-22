
IC = [0.0126233305222100,-0.0888890261984456,0.0153240262876938,-0.0640591907917058,62335.4814325287]

params = parameters(1);
[t,y,poincare] = numericalSolution(IC,params,500);
plot(y(:,1),y(:,2));
return
paramVec = linspace(1,0.1,100);
[mu_30,maxBlock] = continuation(IC,paramVec,200);

figure
hold on
for i =1:length(mu_30)
    scatter(mu_30{i}(:,6),mu_30{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

