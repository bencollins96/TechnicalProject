function [totalPoincare,maxBlock,maxPend] = wContinuation(IC,paramVec,numPeriods)

numIterates = size(paramVec,2);
totalPoincare = cell(numIterates,1);
maxBlock = zeros(numIterates,1);
maxPend  = zeros(numIterates,1);
for i =1:numIterates
    
    %Cycle through the parameter values and assign a time span
    params = parameters(paramVec(i));
    tspan = numPeriods*(2*pi/params.omega);
    
    %Calculate numerical solution. ANd record final 10 poincare crossings
    [t,y,poincare] = numericalSolutionDamp(IC,params,tspan);
    totalPoincare{i} =  [poincare(end-11:end,:),params.c*ones(12,1)];
    
    num = round(0.5*size(y,1));
    maxBlock(i) = max(y(num:end,1));
    maxPend(i)  = max(y(num:end,3));
    
    %Use final max forcing as IC for next round
    IC = poincare(end,:);
    IC(5) = mod(IC(5),2*pi);
    
    i
end
