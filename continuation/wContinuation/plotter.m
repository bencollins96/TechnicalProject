%Plotter

% load('Take2_3-10.mat')
% figure; hold on;
% for i =1:size(totalPoincare,1)
%     scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'k','filled');
% end

figure('pos',[10 10 900 600]); hold on;


%Plot the poincare for 15-22
load('period5.mat')
for i =1:size(totalPoincare,1)
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
load('period1.mat')
for i =1:size(period1,1)
    plot(period1{i}(:,6),period1{i}(:,1),'.g','MarkerSize',8);
end

h2 = plot(period1{1}(1,6),period1{1}(1,1),'.b','MarkerSize',8);
h3 = plot(period1{1}(1,6),period1{1}(1,1),'.r','MarkerSize',8);
h1 = plot(period1{1}(1,6),period1{1}(1,1),'.g','MarkerSize',8);

xlabel('Frequency, omega');
ylabel('Angle');
legend([h1,h2,h3],{'Period 1','Period 3','Period 5'});
