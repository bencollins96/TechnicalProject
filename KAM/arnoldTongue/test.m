IC = [0.001,0,0,0,0];
params = parameters(10);

[t,y,impactInd] = numericalSolution(IC,params,100);
disp('ehy');
[tn,yn,impactIndn] = nonlinSolution(IC,params,100);
    
figure; hold on;
plot(y(:,1),y(:,2));
plot(yn(:,1),yn(:,2));
