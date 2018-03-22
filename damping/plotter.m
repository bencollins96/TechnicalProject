%no pendulum
maximumBlock = 0.014319557807725;

figure('pos',[10,10,900,600]); hold on;
h1 = plot([0,2],[maximumBlock,maximumBlock],'k','LineWidth',2);

%Mu5
load('mu5/mu_52.mat')
h2 = plot(paramVec/2,maxBlock,'-.r','LineWidth',2);

load('mu5/mu_5.mat');
plot(paramVec/2,maxBlock,'-.r','LineWidth',2);

%Mu10
load('mu_10/mu_10.mat')
h3 =plot(paramVec/2,maxBlock,'-.b','LineWidth',2);

load('mu_10/mu_102.mat')
plot(paramVec/2,maxBlock,'-.b','LineWidth',2);

%Mu20
load('mu_20/mu_20.mat')
h4 = plot(paramVec/2,maxBlock,'-.g','LineWidth',2);

load('mu_20/mu_202.mat')
plot(paramVec/2,maxBlock,'-.g','LineWidth',2);

%Mu30
load('mu_30/mu_30.mat')
h5 = plot(paramVec/2,maxBlock,'-.k','LineWidth',2');

load('mu_30/mu_302.mat')
plot(paramVec/2,maxBlock,'-.k','LineWidth',2');

%Mu40
load('mu_40/mu_40.mat')
h6 = plot(paramVec/2,maxBlock,'-.m','LineWidth',2);

load('mu_40/mu_402.mat')
plot(paramVec/2,maxBlock,'-.m','LineWidth',2);

axis([0.1,1,0.0105,0.015]);

legend([h1;h2;h3;h4;h5;h6],{'no pendulum','$\mu =0.05$','$\mu =0.1$','$\mu = 0.2$','$\mu=0.3$','$\mu =0.4$'},'Interpreter','latex','Location','southeast');

xlabel('Pendulum-block height ratio, $l/2b$','Interpreter','latex');
ylabel('Maximum block angle, $\phi$','Interpreter','latex');
set(gca,'FontSize',16);
savefig('lmu.fig');


