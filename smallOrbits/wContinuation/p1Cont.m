params = parameters(25.313);
IC = [0.0530380036301888,-0.0257211701633215,0.102562830762243,-0.0381751208738012,1256.63706143592]

params = parameters(7.40815157700345);
% [t,y,poincare] = numericalSolution(IC,params,500);
% 
% scatter(7.40815157700345*ones(4,1),poincare(end-4:end,1));
% return

paramVec = linspace(7.40815157700345,7.38,30);
[totalPoincare] = wContinuation(IC,paramVec,500);

hold on
for i =1:length(totalPoincare)
    scatter(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'b','filled');
end