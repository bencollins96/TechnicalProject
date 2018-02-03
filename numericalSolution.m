%% Numerical Solution Left Rocking (phi > 0)
% TODO: Does psidot affect the block?
% TODO: Doesn't look like the steady state is right 

hold on

parameters

%IC = [a*(1+mu)/b*(1+2*mu); 0; 0.1;0]; Almost oscillatory.
%IC = [params(4)/params(1),-0.01,-0.0291,0]; this too...
IC = [-params(4)/params(1),0,0,0];
t = linspace(0,4,400);
[t,y] = ode45(@(t,x)odeFunRight(t,x,params),t, IC);
y = y';
plot(t,y(1,:),t,y(3,:));
legend('phi','psi');
xlabel('Time');
ylabel('Angle');

%This one is working, be careful of sign!
function dx = odeFunLeft(t,x,params)
%Strictly phi > 0
forcing = params(9)*cos(params(10)*t);
dx1 = x(2);
dx2 = params(1)*x(1) + params(2)*x(3) + params(3)*forcing - params(4);
dx3 = x(4);
dx4 = params(5)*x(1) + params(6)*x(3) + params(7)*forcing - params(8);
 

dx = [dx1;dx2;dx3;dx4];
end

function dx = odeFunRight(t,x,params)
%Strictly phi > 0
forcing = params(9)*cos(params(10)*t);
dx1 = x(2);
dx2 = params(1)*x(1) + params(2)*x(3) + params(3)*forcing + params(4);
dx3 = x(4);
dx4 = params(5)*x(1) + params(6)*x(3) + params(7)*forcing + params(8);
 

dx = [dx1;dx2;dx3;dx4];
end


