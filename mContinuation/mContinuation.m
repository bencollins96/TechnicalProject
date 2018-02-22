%%mContinuation
close all

%TODO: Be clever with event function to detect poincare crossings

params = parameters(0);
ss = -params.P/params.A;

tSpan = 300*(2*pi/params.omega);
[t,y] = numericalSolution([4*10^(-2),0,0,0,0],params,tSpan);
[~,locs] = findpeaks(cos(params.omega*t));
IC = y(locs(end),:);

numIterates = 1;
mapCell = cell(numIterates,1);

for i =1:numIterates
    
    params = parameters(1e-8);
    
    tspan = 100*(2*pi/params.omega);
    
    %Calculate numerical solution.
    [t,y] = numericalSolution(IC,params,tSpan);
    
    %Sample at least 10 max forcings.
    [~,locs] = findpeaks(cos(params.omega*t));
    mapCell{i} = y(locs(end-9:end),1:4);
    
    %Use final max forcing as IC for next round
    IC = y(locs(end),:);
    
    %Increment
end


figure; hold on
for i =1:numIterates
  
    poincare = mapCell{i};
    scatter((0.1*i)*ones(10,1),poincare(:,1),'y');
    scatter((0.1*i)*ones(10,1),poincare(:,2),'b');
    scatter((0.1*i)*ones(10,1),poincare(:,3),'r');
    scatter((0.1*i)*ones(10,1),poincare(:,4),'k');
        
end

title('Poincare section (Max forcing) vs omega');
xlabel('omega');
ylabel('Angle / angular velocity');




tStable = size(y,1)/2;
plot(t,y(:,1:2))
hold on
plot(t,0.1*cos(params.omega*t))
figure
plot(y(tStable:end,1),y(tStable:end,2))