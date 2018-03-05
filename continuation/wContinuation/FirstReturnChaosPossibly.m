omega = 7.79253414699925;
params = parameters(1);
%Torus
%params = parameters([18.4302261767513]/params.p);
%IC =[-0.0649559480057547,0.0647917560864494,-0.303228671141056,0.133369347504483,1884.95559215388];

% %Fixed point right next to torus.
% params = parameters(18.4485282881483/params.p);
% IC = [0.0676276382727137,0.341274634698901,0.209125100155258,1.57474420763069,38773.5365306052];

%%Period 15
%params = parameters([17.9360691690331]/params.p);
%IC = [-0.0770720429675682,-0.0323733532606133,-0.401841744954691,-0.464381788598737,1878.67240684670];

%%Just before period 15 is TORUS!
% IC = [0.0502607911195957,0.451806174249096,0.0971470851390994,2.16946368971100,1884.95559215388];
% params = parameters(17.9543712804300/params.p)

%%Just after period 15
IC = [-0.0811299377358745,0.0145858201273893,-0.449676714596726,-0.191076133608369,1884.95559215388]
params = parameters(17.9177670576361/params.p)
[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,3000);



figure; hold on;
num = round(0.9*length(y));
plot(y(num:end,1),y(num:end,2))
scatter(poincare(2000:end,1),poincare(2000:end,2))

%Messy
impactTimes = t(impactInd);
impactDifference  =  [impactTimes;0] - [0;impactTimes];
impactDifference = impactDifference*(2*pi/params.omega);


figure
scatter(impactDifference(2:end-2),impactDifference(3:end-1),'k')
hold on



