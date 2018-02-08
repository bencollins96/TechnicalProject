%% Numerical Solution Left Rocking (phi > 0)
% TODO: Does psidot affect the block?
% TODO: Doesn't look like the steady state is right 
clear all
parameters

ss = -P/A;
r  = 0.9;

%IC = [a*(1+mu)/b*(1+2*mu); 0; 0.1;0]; Almost oscillatory.
%IC = [params(4)/params(1),-0.01,-0.0291,0]; this too...
IC = [ss- 0.5*ss,0,0,0];

%How long do we wait for an impact?
tLim = 10;

yTotal = [];
tTotal = [];
currentTime = 0;

for i = 1:20
    
    
    time = linspace(0,tLim,400);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,te,ye,ie] = ode45(@(t,x)odeFunLeft(t,x,params,IC),time, IC,options);
    crossTime = te;
    
    if isempty(crossTime)
        yTotal = [yTotal,y];
        tTotal = [tTotal,tVec + currentTime];
        fprintf('Block does not impact in %ds interval\n',tLim);
        break
    end
    
    %Solve up to crossTime
    tVec = linspace(0,crossTime,200);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,te,ye,ie] = ode45(@(t,x)odeFunLeft(t,x,params,IC),tVec, IC,options);
    
    %Initial Conditions for cycle are end conditions of previous
    IC = y(end,:);
    IC(2) = r*IC(2);
   
    %Ensure that system starts on the correct corner.
    IC(1) = sign(IC(2))*eps;
    
    %Add solution to total solution
    yTotal = [yTotal;y];
    tTotal = [tTotal,tVec + currentTime];
    
    %To match offset in times
    currentTime = currentTime + crossTime;
end
    
plot(tTotal,yTotal);
legend('phi','dphi','psi','dpsi');
xlabel('Time');
ylabel('Angle');
title('Numerical Solution - Linearised');
grid on

%This one is working, be careful of sign!
function dx = odeFunLeft(t,x,params,IC)

rocking = sign(IC(1));

forcing = params(9)*cos(params(10)*t);
dx1 = x(2);
dx2 = params(1)*x(1) + params(2)*x(3) + params(3)*forcing + rocking*params(4);
dx3 = x(4);
dx4 = params(5)*x(1) + params(6)*x(3) + params(7)*forcing + rocking*params(8);
 
dx = [dx1;dx2;dx3;dx4];
end