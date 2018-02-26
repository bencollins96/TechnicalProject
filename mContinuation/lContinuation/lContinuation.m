%wContinuation
close all

%TODO why are there jumps? Really wanna say fractals but not so likely.
%Pendulum doesnt do normal things... I think that is what messes it up, may
%it is approximately a period 3 orbit? Does the pendulum have its own weird
%orbit?
%TODO: Also poincare is not doing too well..

%Initialise Parameters
params = parameters(0.75);
ss = -params.P/params.A;

%Find initial solution without block & Save the initial conditions.
tSpan = 300*(2*pi/params.omega);

%Big scary initial condition came from mass continuation.
[t,y,poincare] = numericalSolution([1e-8,0,0,0,0],params,tSpan);
IC = poincare(end,:);

%IC =  [-0.0563304472077300,0.0445490167813527,-0.490913139842833,-0.134214034921615,1878.67240684670];
%IC = [0.0473012111474028,-0.0356252069074184,0.0597146046827487,-0.0267008531665352,1884.95559215388];

%Cell containing poincare section crossings for each param value

numIterates =1;
paramVec = linspace(1,0.01,numIterates);
totalPoincare = cell(numIterates,1);
paramsVec = paramVec(1:numIterates);


for i =1:numIterates
    
    %Cycle through the parameter values and assign a time span
    params = parameters(0.6);
    tspan = 1000*(2*pi/params.omega);
    
    %Calculate numerical solution. ANd record final 10 poincare crossings
    [t,y,poincare] = numericalSolution(IC,params,tspan);
    totalPoincare{i} =  [poincare(end-11:end,:),params.omega*ones(12,1)];
    
    %Use final max forcing as IC for next round
    IC = poincare(end,:);
    IC(5) = mod(IC(5),2*pi);
    
    i
end

%Plotting

figure; hold on
for i =1:numIterates
    scatter(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'k');
end

title('Poincare section (Max forcing) vs omega');
xlabel('omega');
ylabel('Angle / angular velocity');

figure


tStable =round(size(y,1)/2);
hold on
plot(y(tStable:end,1),y(tStable:end,2))