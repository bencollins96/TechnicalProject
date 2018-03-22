%%plot r=1 orbit
close all 
load 'unforced.mat'

figure('pos',[10,10,900,600]);
plot(y(:,1),y(:,2));
xlabel('Block angle, $\phi$','Interpreter','latex');
ylabel('Block angular velocity, $\dot{\phi}$', 'Interpreter','latex');
set(gca,'FontSize',16);

figure('pos',[10,10,900,600]);
plot(t(1:5100),y(1:5100,3));
xlabel('Time','Interpreter','latex');
ylabel('Pendulum angle, $\psi$', 'Interpreter','latex');
set(gca,'FontSize',16);

figure('pos',[10,10,900,600]);
plot(impactInd(:,3),impactInd(:,4));
xlabel('Pendulum angle, $\psi$','Interpreter','latex');
ylabel('Pendulum anglular velocity, $\dot{\psi}$', 'Interpreter','latex');
set(gca,'FontSize',16);