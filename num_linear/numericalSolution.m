%% Numerical Solution Left Rocking (phi > 0)
% TODO: Does psidot affect the block?
% TODO: Doesn't look like the steady state is right 
clear all
parameters

ss = -P/A;

%IC = [a*(1+mu)/b*(1+2*mu); 0; 0.1;0]; Almost oscillatory.
%IC = [params(4)/params(1),-0.01,-0.0291,0]; this too...
IC = [ss - 0.5*ss,0,0,0]
t = linspace(0,4,400);
options = odeset('Events',@eventFcn,'RelTol',1e-13,'AbsTol',1e-15);
[t,y,te,ye,ie] = ode45(@(t,x)odeFunLeft(t,x,params,IC),t, IC,options);
y = y';
plot(t,y(1,:),t,y(3,:));
legend('phi','psi');
xlabel('Time');
ylabel('Angle');
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