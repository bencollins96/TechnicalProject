%no pendulum
maximumBlock = [0.0130994415373890];

figure('pos',[10,10,900,600]); hold on;
h1 = plot([0,1],[maximumBlock,maximumBlock]);

%Mu5
load('mu5/mu_5.mat')
h2 = plot(paramVec,maxBlock,'r');

%Mu10
load('mu_10/mu_10.mat')
h3 =plot(paramVec,maxBlock,'b');

%Mu20
load('mu_20/mu_20.mat')
h4 = plot(paramVec,maxBlock,'g');

%Mu30
load('mu_30/mu_30.mat')
h5 = plot(paramVec,maxBlock,'k');

%Mu40
load('mu_40/mu_40.mat')
h6 = plot(paramVec,maxBlock,'m');

axis([0.2,1,0.014,0.017]);
% 
legend([h1;h2;h3;h4;h5;h6],{'no pendulum','mu =5','mu =10','mu = 20','mu=30','mu =40'});

xlabel('Pendulum Length, l','Interpreter','latex');
ylabel('Maximum block angle in periodic motion');


