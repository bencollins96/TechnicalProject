%test.m
parameters
params = [beeta,omega,r_0,r_1,theta_0,theta_1,M,m,J,l];

figure
hold on
    
%test nonlinear
nonlinearSolution
eTotal1 = energy(tTotal,yTotal,params);

%test numerical
numericalSolution
eTotal2 = energy(tTotal,yTotal,params);

figure 
plot(tTotal',eTotal1,tTotal',eTotal2);
