params = parameters(2);
IC = [-0.0311206934635207,-0.0649226910756868,-0.135640622907156,-0.340542798793856,3763.62799900057]
paramVec = linspace(30,35,40);

[totalPoincare] = wContinuation(IC,paramVec,200);

figure; hold on
for i =1:length(totalPoincare)
    scatter(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'k','filled');
end