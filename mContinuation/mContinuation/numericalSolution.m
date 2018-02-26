%% Numerical Solution
%Structure:
%          1) Calculate impact time
%          2) Solve equations up until first impact, detected w/ event
%          function
%          3) Add this solution to yTotal, 
%          4) solve equations up to next impact time and repeat.

%TODO: fix up to final session...

function [tTotal,yTotal,poincare] = numericalSolution(IC,params,tSpan)

%How long do we wait for an impact?
tLim        = 5;
yTotal      = zeros(60000,5);
tTotal      = zeros(60000,1);
poincare    = [];
currentTime = 0;
stop        = 0;
impactNum   = 0;
curInd= 0;

while ~stop
  
    %Check if could go over time span.
    tToEnd = tSpan - currentTime;   
    
    if tToEnd < tLim
        
        time = linspace(0,tToEnd,200);
        options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
        [tEnd,yEnd,te,ye,ie] = ode45(@(t,x)rockingBlockEq(t,x,IC,params),time, IC,options);  
        impactTime = te(ie==1);
        
        %If time span has been achieved, stop.
        if isempty(impactTime)
            yTotal(1+curInd:curInd + 200,:) = yEnd;
            tTotal(1+curInd:curInd + 200)   = tEnd + currentTime;
            if any(ie ==2)
                poincare = [poincare;ye(ie==2,:)];
            end
            curInd = curInd + 200;
            stop = 1;
            break
        end
    end
        
    %Calculate the impact time.
    time = linspace(0,tLim,200);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,te,ye,ie] = ode45(@(t,x)rockingBlockEq(t,x,IC,params),time, IC,options);
    impactTime   = te(ie ==1);
  
    %if there is no impact stop simulation. Or if impact's are
    %accumulating.
    if isempty(impactTime)
        yTotal(1+curInd:curInd + 200,:) = y;
        tTotal(1+curInd:curInd + 200) = t + currentTime;
        if any(ie==2)
            poincare = [poincare;ye(ie==2,:)];
        end
        curInd = curInd + 200;
        fprintf('Block does not impact in %ds interval\n',tLim);
        break
    elseif impactTime < 0.00001
        yTotal(1+curInd:curInd + 200,:) = y;
        tTotal(1+curInd:curInd + 200) = t + currentTime;
        if any(ie ==2)
            poincare = [poincare;ye(ie==2,:)];
        end
        curInd = curInd + 200;
        fprintf('Block is settling\n');
        break
    end
    
    %Solve equations up to crossTime
    tVec = linspace(0,impactTime,200);
    options = odeset('Events',@(t,y)eventFcn(t,y),'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,~,ye,ie] = ode45(@(t,x)rockingBlockEq(t,x,IC,params),tVec, IC,options);
    
    %Add poincare sections to list
    if  any(ie == 2)
        poincare = [poincare;ye(ie==2,:)];
    end
    %Initial Conditions for cycle are end conditions of previous
    IC = y(end,:);
    
    %reduce dphi by factor of r
    IC(2) = params.r*IC(2);
   
    %Ensure that system starts on the correct corner. 
    IC(1) = sign(IC(2))*eps;
    
    %Add solution to total solution
    yTotal(1+curInd:curInd + 200,:) = y;
    tTotal(1+curInd:curInd + 200) = t + currentTime;
    
    %To match offset in times + indices
    currentTime = currentTime + impactTime;
    impactNum = impactNum +1;
    
    curInd = curInd + 200;
end
   
yTotal = yTotal(1:curInd,:);
tTotal = tTotal(1:curInd,:);

function dx = rockingBlockEq(~,x,IC,params)

rocking = sign(IC(1));
    
%Time for forcing, autonomous equations: extra variable.
forcingTime = x(5);

forcing = -params.beeta*cos(forcingTime);
dx1 = x(2);
dx2 = params.A*x(1) + params.B*x(3) + params.C*forcing + rocking*params.P;
dx3 = x(4);
dx4 = params.D*x(1) + params.E*x(3) + params.F*forcing + rocking*params.Q;
dx5 = params.omega;

dx = [dx1;dx2;dx3;dx4;dx5];
end

end
