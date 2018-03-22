%Chaos continued
close all 
params = parameters(0);
omega = 17.7703145141713741/params.p;
params = parameters(omega);

%paramVec = linspace(omega,omega,10);
paramVec = paramVec(end);
% %Same two just further on
% IC = [-0.0711559173608701,0.187931800751237,-0.404070704040282,0.880069491788736,42914.1556480366];
% 
% %Classic, cloud 17.823145141713741
% IC = [0.101017336119296,0.262350504663327,0.385172625908325,1.22608404117792,128459.723605287];
% 
% %After wards, maybe lines appearing 17.803145141713741
% IC = [0.104478005807236,0.332110146646309,0.393444743098191,1.72186888183159,188929.099001583];
% 
% %omega = 17.7903145141713741 still cloudy
% IC = [0.0849918408064184,-0.449206415803431,0.351078895666950,-1.81192444224907,206729.362976823];
% 
% %omega = 17.7803145141713741 ditto 
% IC = [0.106405407280316,0.316603670222742,0.395839075186446,1.62705179371203,224517.060581448];

%Still Cloudy 17.7703145141713741
IC = [0.0944353208407954,0.414482899710621,0.324670138563527,2.21848223442027,140711.934954287];

total = cell(length(paramVec),4);



for i  = 1:length(paramVec)
    params = parameters(paramVec(i));
    [t,y,poincare,impactInd] = numericalSolutionImp(IC,params,4800);
    total{i,1} = t;
    total{i,2} = y;
    total{i,3} = poincare;
    total{i,4} = impactInd;
end

figure
plot(y(:,1),y(:,2));
title('Chaotic Orbit');
ylabel('dphi');
xlabel('phi');
savefig('ChaosOrbit.fig');
close

impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);

figure;
plot(impactDifference(2:end-2),impactDifference(3:end-1),'.k')
xlabel('Time Difference i');
ylabel('Time Difference i + 1');
title('First return Map');
savefig('ChaosFirstReturn.fig');
close

