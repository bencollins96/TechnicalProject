params = parameters(2.512820512820519);
IC = [-0.077072042967568,-0.032373353260613,-0.401841744954691,-0.464381788598737,1.878672406846700e+03];
[t,y,poincare] = numericalSolution(IC,params,1000);
figure; hold on;


scatter(poincare(2000:end,1),poincare(2000:end,2))
plot(y(200000:end,1),y(200000:end,2))
xlabel('Phi');
ylabel('dphi');
title('Asymmetric Period 15 Orbit');