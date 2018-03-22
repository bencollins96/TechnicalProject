%IC = [0.004114939845612,0.058022614493736,0,0,1.256637061435906e+03];
IC = [0.053303038182731   0.264525593989546   0.134474552802132   1.087123044343341 1.878672406846696e+03];
% paramVec1 = linspace(3,2.6,100);
% paramVec2 = linspace(2.6,2.5,40);
% paramVec = [paramVec1,paramVec2];
% [totalPoincare] = wContinuation(IC, paramVec,300);

paramVec3 = linspace(3,5,100);
[totalPoincare1] = wContinuation(IC, paramVec3,300);
figure; hold on;

for i =1:length(totalPoincare1)
    scatter(paramVec3(i)*ones(12,1),totalPoincare1{i}(:,1),'k','filled');
end

%param = 2.6 omega
% 
% IC = [-0.054788945971548   0.064108214231120  -0.287758200552693   0.115836058553686  1.884955592153875e+03];
% paramVec = linspace(2.6,2.5,40);
% 
% [totalPoincare] = wContinuation(IC, paramVec,300);
% 
% figure; hold on;
% for i =1:length(totalPoincare)
%     scatter(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'k','filled');
% end
