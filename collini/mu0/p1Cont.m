

%l = 0.75
IC = [0.00485372639452061,-0.00769743375801150,0,0,29386.4576816789];

params = parameters(1);
[t,y,poincare] = numericalSolution(IC,params,500);
plot(y(:,1),y(:,2));
maxBlock = max(y(:,1));

plot([0,1],[maxBlock,maxBlock]);

