%% Numerical solution of Nonlinear equations
%Always bounded! although block sinks into floor, solution is bounded with
%no impacts.

%TODO: Definite problem with negative version
%TODO: Also it has trouble refinding the impact...

clear all
nonlinParameters

%steady state
ss = atan(-P/A);


%Coefficient of restitution
r = 0.9;


%How long do we wait for an impact?
tLim = 5;

yTotal = [];
tTotal = [];
currentTime = 0;

IC = [-ss + 0.1*ss,0,0,0];

for i =1:5
    time = linspace(0,tLim,400);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,crossTime,ye,ie] = ode45(@(t,x)nonlinearODE(t,x,IC),time,IC,options);
    
    if isempty(crossTime)
        yTotal = [yTotal;y];
        tTotal = [tTotal,time + currentTime];
        fprintf('Block does not impact in %ds interval\n',tLim);
        break
    end
    
    %Solve up to crossTime
    tVec = linspace(0,crossTime+200*eps,200);
    [t,y,crossTime,ye,ie] = ode45(@(t,x)nonlinearODE(t,x,IC),tVec,IC,options);
     
    %New initial conditions are end conditions of previous
    IC = y(end,:);
 
    
    IC(2) = r*IC(2);
    
    %Ensure system starts on the correct corner
    IC(1) = sign(IC(2))*eps;
    
    %Add solution to total solution
    yTotal = [yTotal;y];
    tTotal = [tTotal,tVec + currentTime];
    
    %To match offset in times
    currentTime = currentTime + crossTime;
    
    i
end

plot(tTotal,yTotal);
legend('phi','dphi','psi','dpsi');
xlabel('Time');
ylabel('Angle');
title('Numerical Solution - Nonlinear');
grid on

    

function  dx=nonlinearODE(t,x,IC)
%Steady state is [tan(a(1+mu)/b(1+2mu)),0,0,0];

%Rocking side:
rocking = sign(IC(1));

nonlinParameters
x_24 = -m*l*r_1*sin(theta_1 + rocking*(x(1) - x(3)));

massMatrix = [1,                      0, 0 ,    0;... 
              0, (M*r_0^2 + m*r_1^2 +J), 0 , x_24;...
              0,                      0, 1 ,    0;...
              0,                   x_24, 0 , m*l^2 ]; 
          
odeConvert = [x(2);0;x(4);0];

forcing = [0; (M*r_0*sin(theta_0+ rocking*x(1)) + m*r_1*sin(theta_1 + rocking*x(1))); 0 ; -m*l];
forcing = fddot.*forcing;

mystery = [0;-x(4)^2;0;x(2)^2];
mystery = m*l*r_1*cos(theta_1 + rocking*(x(1) - x(3))).*mystery;

constant = [0; - M*g*r_0*cos(theta_0 + rocking*x(1)) - m*g*r_1*cos(theta_1 + rocking*x(1));...
            0;-m*g*l*sin(x(3))];
        
dx = inv(massMatrix)*(odeConvert + forcing + mystery + constant);


end