params = parameters([20.31350431255660]);

IC = [0.0896324352651044,-0.0513496503605525,0.125894549218367,-0.0432507957297523,1250.35387612874];
ICd = [0.0713535274315836,-0.0504037914268124,0.000109125152721499,-0.0738598290303027,1250.35387612874];



params = parameters(7.93232323);

IC = [0.240639155696708,-0.05686930352759761,0.207767045050060,-0.1023529343240843,3135.30946828261];

IC = [0.152506046491075,-0.0372718680060216,0.127957529283556,0.0295018895915783,23744.1572758317];
% [t,y, poincare] = numericalSolutionImp(IC,params,4000);
% num = length(poincare);
% 
% 
% scatter(7.93232323*ones(num,1),poincare(:,1),'*r');
% 
% 
% return


% reverse = [ 0.180000000000000  -0.030000000000000        0  -0.030000000000000                   0];
% %Simulate
% [td,yd,poincared] = numericalSolutionDamp(ICd,params,100);
% [t,y,poincare]   = numericalSolutionImp(IC,params,100);
% 
% %plot
% figure('pos',[10,10,900,600]); hold on
% hUnDamp = plot(y(:,1),y(:,2),'b','LineWidth',2);
% pUnDamp = plot(y(:,3),y(:,4),'Color',[0.6,0.6,1],'LineWidth',2);
% hDamp = plot(yd(:,1),yd(:,2),'k','LineWidth',2);
% pDamp = plot(yd(:,3),yd(:,4),'Color',[.6,.6,.6],'LineWidth',2);
% 
% return 



% [t,y,poincare] = numericalSolution(IC,params,500);
% 
% scatter(7.40815157700345*ones(4,1),poincare(end-4:end,1));
% return
paramVec = linspace(7.93232323,7.85,10);
paramVec2 = linspace(7.9323232,8,10);
%[totalPoincare]  = wContinuation(IC,paramVec,200);
%IC = [0.132517339622406,-0.0563701466398563,-4.25657889728241e-05,-0.0600609156559073,1250.35387612874]
% [totalPoincare] = wContinuation(IC,paramVec,500);
% [totalPoincare2] = wContinuation(IC,paramVec2,500);
%  
% totalPoincare = [totalPoincare;totalPoincare2];


IC = [0.131420215671749,-0.0567310513802830,0.189443744714771,-0.0356144688353325,1884.95559215388];

paramVec = linspace(8.13711872709398,10,57);
[totalPoincare] = wContinuation(IC,paramVec,100);

 

%[0.0898421913669454,-0.0514396417596760,0.126073427289639,-0.0435402111605802,1878.67240684670,9.98572464710667]
hold on
% for i =1:length(totalPoincare)
%     scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'b','filled');
% end
%
for i =1:length(totalPoincare)
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'k','filled');
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,2),'r','filled');
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,3),'b','filled');
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,4),'g','filled');
end