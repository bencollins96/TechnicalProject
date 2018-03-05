%test.m
%TODO: ANalytic still messes up with forcing term for l not equal to
%0.5....


clear all 
close all

params = parameters;
ss = -params.P/params.A;
hold on

%Pair of IC's the second is just before the block impacts and gains energy.
IC = [0.5*atan(ss),0,0,0,0];
tSpan = 3;

%test nonlinear
fprintf('Testing numerical nonlinear...\n');
[tTotal1,yTotal1] =nonlinearSolution(IC,params,tSpan);
eTotal1 = energy(tTotal1,yTotal1,params);

%test numerical
fprintf('Testing numerical linear...\n');
[tTotal2,yTotal2] = numericalSolution(IC,params,tSpan);
eTotal2 = energy(tTotal2,yTotal2,params);

%test petri
fprintf('Testing Petri linear version ...\n');
[tTotal3,yTotal3] = runfilippov(IC,params,tSpan);
eTotal3 = energy(tTotal3,yTotal3,params);


%test Analytic
fprintf('Testing Analytic linear...\n');
[tTotal4,yTotal4] = analytic_solver(IC,params,tSpan);
eTotal4  = energy(tTotal4,yTotal4,params);


plot(tTotal1,yTotal1(:,1),'g');
hold on
plot(tTotal2,yTotal2(:,1),'b');
plot(tTotal3,yTotal3(:,1),'r');
plot(tTotal4,yTotal4(:,1),'k');
xlabel('Time');
ylabel('Block Angle')

figure
plot(tTotal1,yTotal1(:,1),'g');
hold on
plot(tTotal2,yTotal2(:,1),'b');
plot(tTotal3,yTotal3(:,1),'r');
plot(tTotal4,yTotal4(:,1),'k');
xlabel('Time');
ylabel('Block Angle')

return



% %Plotting
% %Plot the time series.
% figure(1)
% subplot(2,1,1)
% hold on
% 
% plot(tTotal1,yTotal1(:,1:4),'k');
% plot(tTotal2,yTotal2(:,1:4),'b');
% 
% tEnd = tTotal1(end);
% [~,iEnd] = min(abs(tTotal3 - tEnd));
% 
% plot(tTotal3(1:iEnd),yTotal3(1:iEnd,1:4),'g');
% plot(tTotal4,yTotal4(:,1:4),'r');
% 
% title('Simulations');
% xlabel('Time');
% ylabel('Angle/Angular velocity');

% Plot the energy of the systems
% subplot(2,1,2)
% plot(tTotal1,sum(eTotal1,2),tTotal2,sum(eTotal2,2),tTotal3(1:iEnd),sum(eTotal3(1:iEnd),2),tTotal4,sum(eTotal4,2));
% title('Energy');
% xlabel('Time');
% ylabel('Energy');
% axis([1.1*min(tTotal1),1.1*max(tTotal1),1.1*min(sum(eTotal1,2)),1.1*max(sum(eTotal1,2))]);
% 
% energyGain(yTotal1(200,:))
% sum(eTotal2(200,1:4)) - sum(eTotal2(201,1:4))
% energyGain(yTotal2(200,:))
% 
% Plot the individual energies
% figure(2)
% subplot(2,2,1)
% plot(tTotal1,eTotal1(:,1))
% xlabel('Time');
% ylabel('Block Kinetic Energy');
% 
% subplot(2,2,2)
% plot(tTotal1,eTotal1(:,2))
% xlabel('Time');
% ylabel('Pendulum Kinetic Energy');
% 
% subplot(2,2,3)
% plot(tTotal1,eTotal1(:,3))
% xlabel('Time');
% ylabel('Block Potential Energy');
% 
% subplot(2,2,4)
% plot(tTotal1,eTotal1(:,4))
% xlabel('Time');
% ylabel('Pendulum Potential Energy');


