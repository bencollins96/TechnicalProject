params = parameters(0);

IC = [0.0895951536750154,-0.0513723499981293,0.125678047193594,-0.0434302343943197,6873.80472605447];

% [t,y,poincare] = numericalSolutionDamp(IC,params,500);
% 
% plot(y(:,1),y(:,2));

paramVec = linspace(0,10,50);

[totalPoincare, maxBlock,maxPend] = wContinuation(IC,paramVec,200);

figure; hold on;

for i =1:length(totalPoincare)
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'k');
end

ICnoPend = [0.0895951536750154,-0.0513723499981293,0,0,0];
[t,y] =numericalSolution(ICnoPend,params,500);
maxiBlock = max(y(100000:end,1));


figure('pos',[10,10,900,600]); hold on;
h1 = plot(paramVec,maxBlock,'-ok');
h2 = plot(paramVec,maxPend,'-ob');
h3 = plot([0,10],[maxiBlock,maxiBlock],'r','LineWidth',2);

xlabel('Damping coefficient, $\gamma$','Interpreter','latex');
ylabel('Maximum angle, $\phi$ and $\psi$','Interpreter','latex');

legend([h1;h2;h3],{'Block damped','Pendlum damped','Block alone'},'Interpreter','latex');
set(gca,'FontSize',16);




