params = parameters([20.31350431255660]);

IC = [0.0896324352651044,-0.0513496503605525,0.125894549218367,-0.0432507957297523,1250.35387612874]
ICd = [0.0713535274315836,-0.0504037914268124,0.000109125152721499,-0.0738598290303027,1250.35387612874]



params = parameters(20.31350431255660);



omega = 7.03
reverse = [ 0.180000000000000  -0.030000000000000                   0  -0.030000000000000                   0];
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
IC = [0.0898421913669454,-0.0514396417596760,0.126073427289639,-0.0435402111605802,1878.67240684670]



% [t,y,poincare] = numericalSolution(IC,params,500);
% 
% scatter(7.40815157700345*ones(4,1),poincare(end-4:end,1));
% return
paramVec = linspace(10,7.7,100);

%[totalPoincare]  = wContinuation(IC,paramVec,200);
%IC = [0.132517339622406,-0.0563701466398563,-4.25657889728241e-05,-0.0600609156559073,1250.35387612874]
 [totalPoincare] = wContinuation(IC,paramVec,500);

hold on
% for i =1:length(totalPoincare)
%     scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'b','filled');
% end

for i =1:length(totalPoincare)
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,1),'k','filled');
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,2),'r','filled');
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,3),'b','filled');
    scatter(totalPoincare{i}(:,6),totalPoincare{i}(:,4),'g','filled');
end