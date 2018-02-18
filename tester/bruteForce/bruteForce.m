%bruteForceBifurcation.

startFreq = 8;
params = parameters(startFreq);
IC = [0.5*(-params.P/params.A),0,0,0,0];
numPeriods = 200;
map = [];
numTests = 50;

for i =1:numTests
    
    tSpan = numPeriods*(2*pi/params.omega);
    
    [tTotal,yTotal,impact] = analytic_solver(IC,params,tSpan);
    
        
    [~,locs] = findpeaks(cos(params.omega*tTotal));
    iEnd  = locs(end);  
    map = [map;yTotal(iEnd,:)];
    
    if any(yTotal(iEnd,:) > 1)
        fprintf('IC too large, stopping here\n');
        break
    end
    
    
    
    IC = [yTotal(iEnd,:),tTotal(iEnd)];
    params = parameters(startFreq - 0.05*i);
    
    fprintf('Frequency is = %d\n',startFreq - 0.05*(i-1));
    
end
    
scatter(1:1:numTests, map(:,1));
    
    