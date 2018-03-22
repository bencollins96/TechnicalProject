load 'muContinuation.mat'
close all
figure('pos',[10 10 900 600]);
hold on;

for i =1:length(totalPoincare)
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'.k','MarkerSize',10);
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,2),'.b','MarkerSize',10);
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,3),'.r','MarkerSize',10);
    plot(paramVec(i)*ones(12,1),totalPoincare{i}(:,4),'.g','MarkerSize',10);
end

h1 = plot(paramVec(1),totalPoincare{1}(1,1),'.k','MarkerSize',10);
h2 = plot(paramVec(1),totalPoincare{1}(1,2),'.b','MarkerSize',10);
h3 = plot(paramVec(1),totalPoincare{1}(1,3),'.r','MarkerSize',10);
h4 = plot(paramVec(1),totalPoincare{1}(1,4),'.g','MarkerSize',10);

xlabel('Mass ratio, $\mu$', 'Interpreter','latex');
ylabel('Angle / angular velocity','Interpreter','latex');
legend([h1;h2;h3;h4],{'$\phi$','$\dot{\phi}$','$\psi$','$\dot{\psi}$'},'Location','southeast',...
    'Interpreter','latex');
set(gca,'FontSize',16);
savefig('mContinuationP1.fig');
