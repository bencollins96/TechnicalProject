%% Big torus
omega = 7.79253414699925;
params = parameters(1);
params = parameters(omega/params.p);

IC = [0.0917887499279652,0.0733954630700953,0.0891418537477012,0.800676196227706,17460.9719686521];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,1000);
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);

%%Small torus
omega =7.93036797903714;
params = parameters(1);
params = parameters(omega/params.p);

IC =[0.103598767061860,-0.0973816565212259,0.155098922288359,-0.258433506625162,81178.7541687603];
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,2000);

%Messy
impactTimes = t(impactInd);
impactDifferenceT  =  [impactTimes;0] - [0;impactTimes];
impactDifferenceT = impactDifferenceT*(2*pi/params.omega);

% %% Big torus
% omega = 7.76;
% params = parameters(1);
% params = parameters(omega/params.p);
% 
% IC = [ 0.071660089917242   0.048963956577480   0.032721507735450   0.628319475030054    5.629734035232908e+04];
% [t,y,poincare,impactInd] = numericalSolutionImp(IC,params,5000);
% impactTimes = t(impactInd);
% impactDifferenceB  =  [impactTimes;0] - [0;impactTimes];
% impactDifferenceB = impactDifferenceB*(2*pi/params.omega);


figure('pos',[10 10 900 600]);
hold on
scatter(impactDifferenceT(2:end-2),impactDifferenceT(3:end-1),'.','MarkerEdgeColor',[0,0,0],'LineWidth',1);
scatter(impactDifference(2:end-2),impactDifference(3:end-1),'.','b','LineWidth',1);
xlabel('Time between impact $i$ and $i+1$','Interpreter','latex');
ylabel('Time between impact $i+1$ and $i+2$','Interpreter','latex');
h1 = scatter(0.3,0.3,'filled','MarkerEdgeColor',[0,0,0],'LineWidth',10);
h2 = scatter(0.3,0.3,'filled','MarkerEdgeColor','b','LineWidth',10);
scatter(0.3,0.3,'filled','MarkerEdgeColor',[1,1,1],'LineWidth',10);
legend([h1,h2],{'$\omega = 7.9304$','$\omega = 7.9253$'},'Interpreter','latex');
set(gca,'FontSize',16);
savefig('combinedTori.fig');