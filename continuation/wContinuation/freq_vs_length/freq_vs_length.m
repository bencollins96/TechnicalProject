%Plot the resonant frequency as a function of l.
close all 
lVec = linspace(0.1,1,1000);
res = [];

for i =1:length(lVec)
    params_len = parameters(lVec(i));
    params_mu  = parametersM(lVec(i));
    res_length(i) = params_len.resonant;
    res_mu(i)     = params_mu.resonant;
    res_pend(i)   = sqrt(params_len.g/lVec(i));
end


figure('pos',[10 10 900 600]);
h1 = subplot(2,1,1);
hold on
plot1 = plot(lVec,res_length,'LineWidth',2);
plot2 = plot(lVec,res_pend,'LineWidth',2);
%ylabel('Resonant frequency, $\omega_r$','Interpreter','latex');
xlabel('Pendulum Length, $l$','Interpreter','latex');
legend([plot1;plot2], {'Resonant frequency','Pendulum natural frequency'},'Interpreter','latex');
axis([0.1,1,0,15]);
set(gca,'FontSize',16);
hold on;
h2 = subplot(2,1,2);
plot(lVec,res_mu,'LineWidth',2);
%ylabel('Resonant frequency, $\omega_r$','Interpreter','latex');
xlabel('Block-pendulum mass ratio, $\mu$,','Interpreter','latex');
axis([0.1,1,3,6]);
set(gca,'FontSize',16);
p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
h3=axes('position',[p2(1)-0.02 p2(2) p2(3) height],'visible','off');
h_label=ylabel('Resonant frequency $\omega_r$','Interpreter','latex','visible','on');
set(gca,'FontSize',16);
savefig('freq_vs_length.fig');
