%plotterperiod 3

figure('pos',[10 10 900 600]); hold on;

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

xlabel('Frequency, omega');
ylabel('Block Angle');
axis([16.7694   21.4737   -0.0946    0.1070])
savefig('period3BruteForce.fig');
