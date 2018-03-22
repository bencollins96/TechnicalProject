params = Copy_of_parameters(3);


IC = [0.0150451460160203,-0.199499521065362,0.0238654510364636,-0.185741306423690,2136.28300444106]
[t,y, poincare] = numericalSolution(IC,params,100);

figure('pos',[10,10,900,600]); hold on;
plot(y(:,1),y(:,2),'LineWidth',2);
text(0.0005,0.34,'$\dot{\phi}(t_0)$','FontSize',16,'Interpreter','latex');
text(-0.003,-0.5,'$\dot{\phi}(t_1)$','FontSize',16,'Interpreter','latex');
text(0.0005,-0.28,'$r\dot{\phi}(t_1)$','FontSize',16,'Interpreter','latex');



h1 = plot([0,0],[0.6,-0.6],'-.k');
legend(h1,'Impact section','Interpreter','latex');
xlabel('Block angle, $\phi(t)$','Interpreter','latex');
ylabel('Block angular velocity, $\dot{\phi}(t)$','Interpreter','latex');
set(gca,'FontSize',16);    