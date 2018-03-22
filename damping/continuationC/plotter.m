load 'period1UpperFilled.mat'

figure('pos',[10,10,900,600]); hold on;
for i =1:length(newperiod2)
    scatter(newperiod2{i}(:,6),newperiod2{i}(:,1),'g','filled');
end

load '10_641Upper.mat'
for i =1:length(totalPoincareD)
    scatter(totalPoincareD{i}(:,6),totalPoincareD{i}(:,1),'k','filled');
end

h1 = scatter(10,10,'filled','k');
h2 = scatter(10,10,'filled','k');
axis([6,10,0,0.3]);
xlabel('Forcing frequency $\omega$','Interpreter','latex');
ylabel('Block angle $\phi$','Interpreter','latex');
legend([h1;h2],{'$\gamma = 10$', 'undamped'},'Interpreter','latex');
set(gca,'FontSize',16);
savefig('bruteForceDamped.fig');