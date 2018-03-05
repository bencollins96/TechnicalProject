params = parameters(2);

[t,y] = numericalSolutionImp([1e-9,0,0,0,0],params,100);

plot(t,y(:,1),t,y(:,3))
hold on
plot(t,cos(params.omega*t)*max(y(:,1)))

