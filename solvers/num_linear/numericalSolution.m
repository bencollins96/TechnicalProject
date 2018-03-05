%% Numerical Solution
%Structure:
%          1) Calculate impact time
%          2) Solve equations up until first impact, detected w/ event
%          function
%          3) Add this solution to yTotal, 
%          4) solve equations up to next impact time and repeat.


clear all
parameters

ss = -P/A;

%IC = [a*(1+mu)/b*(1+2*mu); 0; 0.1;0]; Almost oscillatory.
%IC = [params(4)/params(1),-0.01,-0.0291,0]; this too...
IC = [ ss - 0.5*ss,0,0,0,0];

%How long do we wait for an impact?
tLim = 5;
numImpacts = 10;

yTotal = [];
tTotal = [];
currentTime = 0;

for i = 1:numImpacts
    
    %Calculate the impact time.
    time = linspace(0,tLim,400);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,crossTime,ye,ie] = ode45(@(t,x)odeFunLeft(t,x,IC),time, IC,options);
    
    %if there is no impact stop simulation 
    if isempty(crossTime)
        yTotal = [yTotal,y];
        tTotal = [tTotal,time + currentTime];
        fprintf('Block does not impact in %ds interval\n',tLim);
        break
    end
    
    %Solve equations up to crossTime
    tVec = linspace(0,crossTime,200);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,te,ye,ie] = ode45(@(t,x)odeFunLeft(t,x,IC),tVec, IC,options);
    
    %Initial Conditions for cycle are end conditions of previous
    IC = y(end,:);
    
    %reduce dphi by factor of r
    IC(2) = r*IC(2);
   
    %Ensure that system starts on the correct corner. 
    IC(1) = sign(IC(2))*eps;
    
    %Add solution to total solution
    yTotal = [yTotal;y];
    tTotal = [tTotal,tVec + currentTime];
    
    %To match offset in times
    currentTime = currentTime + crossTime;
end
    
plot(tTotal,yTotal(:,1:4));
hold on
plot(tTotal,beeta*cos(yTotal(:,5)));
legend('phi','dphi','psi','dpsi');
xlabel('Time');
ylabel('Angle');
title('Numerical Solution - Linearised');
grid on


function dx = odeFunLeft(t,x,IC)

parameters

rocking = sign(IC(1));
    
%Time for forcing, autonomous equations: extra variable.
time = x(5);

forcing = -beeta*omega^2*cos(time);
dx1 = x(2);
dx2 = A*x(1) + B*x(3) + C*forcing + rocking*P;
dx3 = x(4);
dx4 = D*x(1) + E*x(3) + F*forcing + rocking*Q;
dx5 = omega;

dx = [dx1;dx2;dx3;dx4;dx5];
end
