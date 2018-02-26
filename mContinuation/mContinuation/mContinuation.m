%%mContinuation

%TODO: Speed it up!
close all

%Initialise Parameters
params = parameters(0);
ss = -params.P/params.A;

%Find initial solution without block & Save the initial conditions.
tSpan = 300*(2*pi/params.omega);
[t,y,poincare] = numericalSolutionNoPendulum([4*10^(-2),0,0,0,0],params,tSpan);
IC = poincare(end,:);

totalPoincare = [];

numIterates = 10;
mapCell = cell(numIterates,1);
paramVec = linspace(1e-8,0.25,numIterates);


for i =1:numIterates
    
    params = parameters(paramVec(i));
    
    tspan = 100*(2*pi/params.omega);
    
    %Calculate numerical solution.
    [t,y,poincare] = numericalSolution(IC,params,tSpan);
    
%     %Sample at least 10 max forcings.
%     [~,locs] = findpeaks(cos(params.omega*t));
%     mapCell{i} = y(locs(end-9:end),1:4);

    totalPoincare = [totalPoincare; poincare(end-9:end,:)];
    
    %Use final max forcing as IC for next round
    IC = poincare(end,:);
    
    i
    
    %Increment
end


figure; hold on
for i =1:numIterates
    scatter(paramVec(i)*ones(1,10),totalPoincare(i:i+9,1),'y');
    scatter(paramVec(i)*ones(1,10),totalPoincare(i:i+9,2),'b');
    %scatter(paramVec(i)*ones(1,10),totalPoincare(i:i+9,3),'r');
   % scatter(paramVec(i)*ones(1,10),totalPoincare(i:i+9,4),'k');
end

title('Poincare section (Max forcing) vs omega');
xlabel('omega');
ylabel('Angle / angular velocity');

figure
tStable = size(y,1)/2;
plot(t,0.1*cos(params.omega*t))
hold on
plot(y(tStable:end,1),y(tStable:end,2))