%% Numerical Solution
%Structure:
%          1) Calculate impact time
%          2) Solve equations up until first impact, detected w/ event
%          function
%          3) Add this solution to yTotal, 
%          4) solve equations up to next impact time and repeat.

%TODO: breaks down at high omega...

%To solve, maybe solve for a half period at a time? Then increased end.

function [impacts] = nonlinSolutionImpact(IC,params,tSpan)
%How long do we wait for an impact
%num_periods = round(tSpan*params.omega/(2*pi));

tLim        = 1; % period /2? maybe
currentTime = 0;
impacts = zeros(100000,5);
impactInd = 1;
options = odeset('Events',@eventFcn,'RelTol',1e-10,'AbsTol',1e-12);

while true
  
    %Check if could go over time span.
    tToEnd = tSpan - currentTime; 
    if tToEnd < tLim
        time = linspace(0,tToEnd,2000);
        [~,~,te,ye,ie] = ode45(@(t,x)rocking_block(t,x,IC,params),time, IC,options);  
        
        impactTime = te(ie==1);
        if isempty(impactTime) 
            break
        else
            impacts(impactInd,:) = ye;
        end
    end
        
    %Calculate the solution up until impact or time limit is reached
    time = linspace(0,tLim,2000);
    [~,y,te,ye,ie] = ode45(@(t,x)rocking_block(t,x,IC,params),time, IC,options);
    impactTime = te(ie ==1);
  
    %if there is no impact stop simulation. Or if impact's are
    %accumulating.
    if isempty(impactTime)
        
        impacts(impactInd,:) = ye;
        fprintf('Block does not impact in %ds interval\n',tLim);
        break
    elseif impactTime < 0.00001
        impacts(impactInd,:) = ye;
        fprintf('Block is settling\n');
        break
    end
    %Create new initial conditions.
    IC = y(end,:);
    
    %reduce dphi by factor of r
    IC(2) = params.r*IC(2);
   
    %Ensure that system starts on the correct corner. 
    IC(1) = sign(IC(2))*eps;

    %To match offset in times + indices
    currentTime = currentTime + impactTime;
    impacts(impactInd,:) = ye;
    impactInd = impactInd +1;
end
   

impacts = impacts(1:impactInd-1,:);

function  dx=rocking_block(~,x,IC,params)
%Steady state is [tan(a(1+mu)/b(1+2mu)),0,0,0];


%Rocking on left or right?
rocking = sign(IC(1));

%Position variables
dx1 = x(2);
dx3 = x(4);

%off Diagonal mass Matrix element
x_12 = -params.m*params.l*params.r_1*sin(params.theta_1 + rocking*x(1) - x(3));
          
%Mass matrix
massMatrix = [params.M*params.r_0^2 + params.m*params.r_1^2 + params.J, x_12;...
               x_12               , params.m*params.l^2];
             
%Forcing term
forcing = [params.M*params.r_0*sin(params.theta_0 + rocking*x(1)) ...
          + params.m*params.r_1*sin(params.theta_1 + rocking*x(1)); -cos(x(3))*params.m*params.l];
forcing = forcing.*(-params.beeta*cos(x(5)));

%The other term.
mystery = rocking*[-x(4)^2; +x(2)^2];
mystery = params.m*params.l*params.r_1*cos(params.theta_1 + rocking*x(1) - x(3)).*mystery;

%Constant term
constant = [-rocking*(params.M*params.g*params.r_0*cos(params.theta_0 + rocking*x(1))...
            + params.m*params.g*params.r_1*cos(params.theta_1 + rocking*x(1)));...
            -params.m*params.l*params.g*sin(x(3))];

%Total
RHS = forcing + mystery + constant;
dx24 = massMatrix\RHS;

dx2 = dx24(1);
dx4 = dx24(2);
dx5 = params.omega;

dx = [dx1;dx2;dx3;dx4;dx5];
end
end
