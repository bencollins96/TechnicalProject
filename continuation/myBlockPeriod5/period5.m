%Period 5
%mu = 0.25

IC = [-0.0175746499136655,0.206010296683050,-0.0670264019030084,0.603312702379156,20696.8124018496];
params = parameters;

[t,y] = numericalSolution(IC,params,300);
plot(y(:,1),y(:,2))
