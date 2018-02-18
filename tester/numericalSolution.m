%% Numerical Solution
%Structure:
%          1) Calculate impact time
%          2) Solve equations up until first impact, detected w/ event
%          function
%          3) Add this solution to yTotal, 
%          4) solve equations up to next impact time and repeat.


function [tTotal,yTotal] = numericalSolution(IC,params,tSpan)

%How long do we wait for an impact?
tLim = 5;

yTotal = [];
tTotal = [];
currentTime = 0;
stop = 0;

while ~stop
    
    tToEnd = tSpan - currentTime;
    
    if tToEnd < tLim
        time = linspace(0,tToEnd,400);
        options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
        [tEnd,yEnd,crossTime,~,~] = ode45(@(t,x)rockingBLockEq(t,x,IC,params),time, IC,options);  
        
        if isempty(crossTime)
            yTotal = [yTotal;yEnd];
            tTotal = [tTotal;tEnd+ currentTime];
            stop = 1;
            break
        end
    end
        
    
    %Calculate the impact time.
    time = linspace(0,tLim,400);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,crossTime,~,~] = ode45(@(t,x)rockingBLockEq(t,x,IC,params),time, IC,options);
    
    %if there is no impact stop simulation 
    if isempty(crossTime)
        yTotal = [yTotal;y];
        tTotal = [tTotal;t + currentTime];
        fprintf('Block does not impact in %ds interval\n',tLim);
        break
    end
    
    %Solve equations up to crossTime
    tVec = linspace(0,crossTime,200);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,te,~,~] = ode45(@(t,x)rockingBLockEq(t,x,IC,params),tVec, IC,options);
    
    %Initial Conditions for cycle are end conditions of previous
    IC = y(end,:);
    
    %reduce dphi by factor of r
    IC(2) = params.r*IC(2);
   
    %Ensure that system starts on the correct corner. 
    IC(1) = sign(IC(2))*eps;
    
    %Add solution to total solution
    yTotal = [yTotal;y];
    tTotal = [tTotal;t + currentTime];
    
    %To match offset in times
    currentTime = currentTime + crossTime;
end
    

function dx = rockingBLockEq(t,x,IC,params)

rocking = sign(IC(1));
    
%Time for forcing, autonomous equations: extra variable.
forcingTime = x(5);

forcing = -params.beeta*params.omega^2*cos(forcingTime);
dx1 = x(2);
dx2 = params.A*x(1) + params.B*x(3) + params.C*forcing + rocking*params.P;
dx3 = x(4);
dx4 = params.D*x(1) + params.E*x(3) + params.F*forcing + rocking*params.Q;
dx5 = params.omega;

dx = [dx1;dx2;dx3;dx4;dx5];
end

end
