%%Brute Force Bifurcation Diagram

omegaStart = 4.5;
params = parameters(omegaStart);

%Close to being on periodic orbit.
IC = [-0.0028,-0.0159, -0.0192,-0.1231,900];
numIterates = 20;


mapCell = cell(numIterates,1);

for i = 1:numIterates
    tSpan =100*(2*pi/params.omega);
    
    %Calculate Solution.
    [t,y] = numericalSolution(IC,params,tSpan);

    %Sample at last 10 max forcings.
    [~,locs] = findpeaks(cos(params.omega*t));
    mapCell{i} = y(locs(end-9:end),1:4);
    
    %Use final max forcing as IC for next round 
    IC = y(locs(end),:);
    
    %increment omege
    params = parameters(omegaStart + 0.1*i);
    i
end



figure; hold on
for i =1:numIterates
  
    poincare = mapCell{i};
    scatter((omegaStart + 0.1*i)*ones(10,1),poincare(:,1),'y');
    scatter((omegaStart + 0.1*i)*ones(10,1),poincare(:,2),'b');
    scatter((omegaStart + 0.1*i)*ones(10,1),poincare(:,3),'r');
    scatter((omegaStart + 0.1*i)*ones(10,1),poincare(:,4),'k');
    
end

title('Poincare section (Max forcing) vs omega');
xlabel('omega');
ylabel('Angle / angular velocity');
    