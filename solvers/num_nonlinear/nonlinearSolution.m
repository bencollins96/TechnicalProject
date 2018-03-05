%% Numerical solution of Nonlinear equations


%TODO: Some trouble with small impacts....


clear all

%Import parameters.
parameters

%steady state
ss = atan((a*(1+mu))/(b*(1+2*mu)));

%How long do we wait for an impact?
tLim = 5;

yTotal = [];
tTotal = [];
currentTime = 0;

IC = [ss- 0.5*ss,0,0,0,0];

for i =1:numImpacts
    
    %Calculate the impact time if one occurs
    time = linspace(0,tLim,400);
    options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
    [t,y,crossTime,ye,ie] = ode45(@(t,x)nonlinearODE(t,x,IC),time,IC,options);
    
    %if none occurs, stop simulation and output the angles.
    if isempty(crossTime)
        yTotal = [yTotal;y];
        tTotal = [tTotal,time + currentTime];
        fprintf('Block does not impact in %ds interval\n',tLim);
        break
    end
    
    %Solve up to crossTime  additional eps to make sure solved up to
    %crossing time... slightly dodgy.
    tVec = linspace(0,crossTime + 200*eps,200);
    [t,y,crossTime,ye,ie] = ode45(@(t,x)nonlinearODE(t,x,IC),tVec,IC,options);
     
    %New initial conditions are end conditions of previous
    IC = y(end,:);
 
    %includei impact conditions
    IC(2) = r*IC(2);
    
    %Ensure system starts on the correct corner
    IC(1) = sign(IC(2))*eps;
    
    %Add solution to total solution
    yTotal = [yTotal;y];
    tTotal = [tTotal,tVec + currentTime];
    
    %To match offset in times
    currentTime = currentTime + crossTime;
end

plot(tTotal,yTotal(:,1:4),'g');
hold on 
legend('phi','dphi','psi','dpsi');
xlabel('Time');
ylabel('Angle');

title('Numerical Solution - Nonlinear');
grid on

function  dx=nonlinearODE(t,x,IC)
%Steady state is [tan(a(1+mu)/b(1+2mu)),0,0,0];

parameters

%Rocking on left or right?
rocking = sign(IC(1));

%Position variables
dx1 = x(2);
dx3 = x(4);

%off Diagonal mass Matrix element
x_12 = -m*l*r_1*sin(theta_1 + rocking*(x(1) -x(3)));
          
%Mass matrix
massMatrix = [M*r_0^2 + m*r_1^2 + J, x_12;...
               x_12               , m*l^2];
   
%Forcing term
forcing = [M*r_0*sin(theta_0 + rocking*x(1)) + m*r_1*sin(theta_1 + rocking*x(1)); -cos(x(3))*m*l];
forcing = forcing.*(-beeta*omega^2*cos(x(5)));

%The other term.
mystery = rocking*[-x(4)^2; x(2)^2];
mystery = m*l*r_1*cos(theta_1 + rocking*(x(1) - x(3))).*mystery;

%Constant term
constant = [-rocking*(M*g*r_0*cos(theta_0 + rocking*x(1)) + m*g*r_1*cos(theta_1 + rocking*x(1))); -m*l*g*sin(x(3))];

%Total
RHS = forcing + mystery + constant;
dx24 = massMatrix\RHS;

dx2 = dx24(1);
dx4 = dx24(2);
dx5 = omega;

dx = [dx1;dx2;dx3;dx4;dx5];
end