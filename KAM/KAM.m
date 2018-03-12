close all
params = parameters(20);
SS = -params.P/params.A;
IC = [0.1*SS,0,0,0,0];
omega = 20;

%[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,4000);

unforcedStruct = load('unforced.mat');
impactInd = unforcedStruct.impactInd;
y         = unforcedStruct.y;
t         = unforcedStruct.t;

omegaVec = 20*pi/0.54;

for i =1:1

    
    paramsp = parametersp(omegaVec(i)); 
    [tp,yp,poincarep,impactIndP] = numericalSolutionImp(IC,paramsp,4000);
    
    figure; 
    subplot(1,2,1);
    plot(y(impactInd(2000:end),3),y(impactInd(2000:end),4),'.k');
    subplot(1,2,2);
    plot(yp(impactIndP(2000:end),3),yp(impactIndP(2000:end),4),'.r');
    
    omegaVec(i);
    pause
end

figure
plot(y(impactInd,3),y(impactInd,4),'.k');
xlabel('Pendulum Angle, $\psi$','Interpreter','latex');
ylabel('Pendulum Angular velocity , $\dot{\phi}$','Interpreter','latex');
savefig('unforcedWholePoincare.fig');
    