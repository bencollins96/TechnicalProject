close all
params = parameters(20);
SS = -params.P/params.A;
IC = [0.1*SS,0,0,0,0];
omega = 20;

%[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,4000);

unforcedStruct = load('unforced.mat');
impactInd = unforcedStruct.impactInd;
y         = unforcedStruct.y;
t         = unforcedStruct.t;

omegaVec = 10*pi/0.54;

for i =1:1
    
    paramsp = parametersp(omegaVec(i)); 
    [tp,yp,impactIndP] = numericalSolutionImp(IC,paramsp,1000);
    
    figure; 
    subplot(1,2,1);
    plot(y(impactInd(2000:end),3),y(impactInd(2000:end),4),'.k');
    subplot(1,2,2);
    plot(yp(impactIndP(2000:end),3),yp(impactIndP(2000:end),4),'.r');
    
    omegaVec(i);

end

figure('pos',[10,10,900,600]);
plot(y(impactInd,3),y(impactInd,4),'.k');
xlabel('Pendulum Angle, $\psi$','Interpreter','latex');
ylabel('Pendulum Angular velocity , $\dot{\phi}$','Interpreter','latex');
set(gca,'FontSize',16);
savefig('unforcedWholePoincare.fig');

figure('pos',[10,10,900,600]);
h1 =subplot(2,1,1);
scatter(y(impactInd,3),y(impactInd,4),'k','filled');
xlabel('Pendulum Angle, $\psi$','Interpreter','latex');
set(gca,'FontSize',16);
axis([-.049,-0.043,0.86,1.02]);

h2 = subplot(2,1,2);
scatter(yp(impactIndP,3),yp(impactIndP,4),'k','filled');
xlabel('Pendulum Angle, $\psi$','Interpreter','latex');
axis([-.049,-0.043,0.86,1.02]);
set(gca,'FontSize',16);

p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
h3=axes('position',[p2(1)-0.02 p2(2) p2(3) height],'visible','off');
h_label=ylabel('Pendulum Angular velocity , $\dot{\phi}$','Interpreter','latex','visible','on');
set(gca,'FontSize',16);


figure('pos',[10,10,900,600]);
plot(y(impactInd,3),y(impactInd,4),'.k');
xlabel('Pendulum Angle, $\psi$','Interpreter','latex');
ylabel('Pendulum Angular velocity , $\dot{\phi}$','Interpreter','latex');
set(gca,'FontSize',16);
axis([-.049,-0.043,0.86,1.02]);
savefig('unforced.fig');

figure('pos',[10,10,900,600]);
plot(yp(impactIndP,3),yp(impactIndP,4),'.k');
xlabel('Pendulum Angle, $\psi$','Interpreter','latex');
ylabel('Pendulum Angular velocity , $\dot{\phi}$','Interpreter','latex');
set(gca,'FontSize',16);
axis([-.049,-0.043,0.86,1.02]);
savefig('forced.fig');
    