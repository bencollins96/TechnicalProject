%no pendulum
maximumBlock = 0.004863914701220;

figure('pos',[10,10,900,600]); hold on;
h1 = plot([0,1],[maximumBlock,maximumBlock]);

%Mu5
load('mu5/mu_5.mat')
paramVec = zeros(size(maxBlock,1));
for i =1:size(maxBlock,1)
    paramVec(i) = totalPoincare{i}(end,6);
end
h2 = plot(paramVec,maxBlock,'r');

%Mu10
load('mu_10/mu_10.mat')
paramVec = zeros(size(maxBlock,1));
for i =1:size(maxBlock,1)
    paramVec(i) = mu_10{i}(end,6);
end
h3 =plot(paramVec,maxBlock,'b');

%Mu20
load('mu_20/mu_20.mat')
paramVec = zeros(size(maxBlock,1));
for i =1:size(maxBlock,1)
    paramVec(i) = mu_20{i}(end,6);
end
h4 = plot(paramVec,maxBlock,'g');

%Mu30
load('mu_30/mu_30.mat')
paramVec = zeros(size(maxBlock,1));
for i =1:size(maxBlock,1)
    paramVec(i) = mu_30{i}(end,6);
end
h5 = plot(paramVec,maxBlock,'k');

%Mu40
load('mu_40/mu_40.mat')
paramVec = zeros(size(maxBlock,1));
for i =1:size(maxBlock,1)
    paramVec(i) = mu_40{i}(end,6);
end
h6 = plot(paramVec,maxBlock,'m');

axis([0.1,1,4.5e-3,6.5e-3]);

legend([h1;h2;h3;h4;h5;h6],{'no pendulum','mu =5','mu =10','mu = 20','mu=30','mu =40'});

xlabel('Pendulum Length, l','Interpreter','latex');
ylabel('Maximum block angle in periodic motion');


