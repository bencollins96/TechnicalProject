

%l = 0.75
IC = [0.0142951645992623,-0.0128257343360481,0,0,7853.98163397448];
params = parameters(1);
[t,y,poincare] = numericalSolution(IC,params,500);
plot(y(:,1),y(:,2));
maxBlock = max(y(:,1));

plot([0,1],[maxBlock,maxBlock]);

