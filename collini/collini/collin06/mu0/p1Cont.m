

%l = 0.75
IC = [0.0122355884408878,-0.0761376841035114,0,0,15707.9632679490]
params = parameters(1);
[t,y,poincare] = numericalSolution(IC,params,500);
plot(y(:,1),y(:,2));
maxBlock = max(y(:,1));

plot([0,1],[maxBlock,maxBlock]);

