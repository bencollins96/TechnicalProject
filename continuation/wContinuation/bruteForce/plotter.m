%Plotter

% load('Take2_3-10.mat')
% figure; hold on;
% for i =1:size(totalPoincare,1)
%     scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'k','filled');
% end

figure('pos',[10 10 900 600]); hold on;


%Plot the poincare for 15-22
load('period5.mat')
for i =1:101
    plot(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'.r','MarkerSize',8);
end


clear all
load('period3.mat')
for i =1:size(totalPoincare,1)
    plot(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'.b','MarkerSize',8);
end

clear all
load('period3_upper.mat')
for i =1:size(totalPoincare,1)
    plot(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'.b','MarkerSize',8);
end

clear all
load('period3Extra.mat')
for i =1:size(totalPoincare1,1)
    plot(totalPoincare1{i}(:,6),totalPoincare1{i}(:,1),'.b','MarkerSize',8);
end


clear all
load('period1UpperFilled.mat')
for i =1:size(newperiod2,1)
    plot(newperiod2{i}(:,6),newperiod2{i}(:,1),'.g','MarkerSize',8);
end

clear all
load('period1Extra.mat')
for i =1:size(p1B,1)
    plot(p1B{i}(:,6),p1B{i}(:,1),'.g','MarkerSize',8);
end

h2 = plot(0,0,'.b','MarkerSize',8);
h3 = plot(0,0,'.r','MarkerSize',8);
h1 = plot(0,0,'.g','MarkerSize',8);

xlabel('Frequency, $\omega$','Interpreter','latex');
ylabel('Block Angle, $\phi$','Interpreter','latex');
legend([h1,h2,h3],{'period 1','period 3','period 5'},'Interpreter','latex');
axis([5,35,-0.1,0.2]);
set(gca,'FontSize',16);