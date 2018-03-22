% paramVecS = linspace(3,1.14,80);
% paramVecS1 = linspace(1.14,1,30);
% paramVecS1 = paramVecS1(1:11);
% paramVecS = [paramVecS,paramVecS1];
IC = [0.0203435815925418,-0.0267740513165166,0.0267028825661786,-0.0233876958255747 1878.67240684670];
% [p1S] = wContinuation(IC, paramVecS,300);
paramVecB = linspace(3,5,100);
[p1B] = wContinuation(IC,paramVecB,300);
% figure; hold on;
% for i =1:length(p1S)
%     scatter(paramVecS(i)*ones(12,1),p1S{i}(:,1),'k','filled');
% end
% for i =1:length(p1B)
%     scatter(paramVecB(i)*ones(12,1),p1B{i}(:,1),'k','filled');
% end