%test.m
%TODO: ANalytic still messes up with forcing term for l not equal to
%0.5....


clear all 
close all

params = parameters;

hold on
    
%test nonlinear
fprintf('Testing numerical nonlinear...\n');
[tTotal1,yTotal1] =nonlinearSolution;
eTotal1 = energy(tTotal1,yTotal1,params);

%test numerical
fprintf('Testing numerical linear...\n');
[tTotal2,yTotal2] = numericalSolution;
eTotal2 = energy(tTotal2,yTotal2,params);

%test petri
fprintf('Testing Petri linear version ...\n');
[tTotal3,yTotal3] = runfilippov;
eTotal3 = energy(tTotal3,yTotal3,params);

%test Analytic
fprintf('Testing Analytic linear...\n');
[tTotal4,yTotal4] = analytic_solver;
eTotal4  = energy(tTotal4,yTotal4,params);


%Plotting
%Plot the time series.
subplot(2,1,1)
hold on

plot(tTotal1,yTotal1(:,1:4),'k');
plot(tTotal2,yTotal2(:,1:4),'b');

tEnd = tTotal1(end);
[~,iEnd] = min(abs(tTotal3 - tEnd));

plot(tTotal3(1:iEnd),yTotal3(1:iEnd,1:4),'g');
plot(tTotal4,yTotal4(:,1:4),'r');

title('Simulations');
xlabel('Time');
ylabel('Angle/Angular velocity');

%Plot the energy of the systems
subplot(2,1,2)
plot(tTotal1,eTotal1,tTotal2,eTotal2,tTotal3(1:iEnd),eTotal3(1:iEnd),tTotal4,eTotal4);
title('Energy');
xlabel('Time');
ylabel('Energy');
