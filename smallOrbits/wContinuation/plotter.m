figure('pos',[10 10 900 600]); hold on;


%Plot the poincare for 15-22
load('p1Poincare/p135-7_4125ANDBifUpper.mat')
for i =1:size(totalPoincare,1)
    plot(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'.g','MarkerSize',8);
end


clear all
load('p3Poincare/p335-17.93BiffilledUpper.mat')
for i =1:size(totalPoincare,1)
    plot(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'.b','MarkerSize',8);
end

clear all
load('p5Poincare/p535-28.14Bif+.mat')
for i =1:size(totalPoincare,1)
    plot(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'.r','MarkerSize',8);
end


h2 = plot(10,-0.02,'*b','MarkerSize',8);
h3 = plot(10,-0.02,'*r','MarkerSize',8);
h1 = plot(10,-0.02,'*g','MarkerSize',8);
plot(10,-0.02,'*w','MarkerSize',8);


xlabel('Forcing frequency, $\omega$','Interpreter','latex');
ylabel('Block angle, $\phi$','Interpreter','latex');
legend([h1,h2,h3],{'Period 1','Period 3','Period 5'},'Interpreter','latex');
set(gca,'FontSize',16);
savefig('bruteForce.fig');
close 


figure('pos',[10 10 900 600]); hold on;
load('p3Poincare/p335-17.93BiffilledUpperZoom.mat')
for i =1:size(totalPoincare,1)
    plot(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'.b','MarkerSize',8);
end
axis([17,20,-0.04,0.05]);
xlabel('Forcing frequency, $\omega$','Interpreter','latex');
ylabel('Block angle, $\phi$','Interpreter','latex');
set(gca,'FontSize',16);
savefig('bruteForceP3.fig');
