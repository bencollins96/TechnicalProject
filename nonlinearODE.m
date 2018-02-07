function  dx=nonlinearODE(t,x)
%Steady state is [tan(a(1+mu)/b(1+2mu)),0,0,0];

m  = 0.5;
M = 1;
l = 0.5;
a = 0.1;
b = 1;
g = 9.81;
theta_1 = atan(2*b/a);
theta_0 = atan(b/a);
r_0 = sqrt(a^2 + b^2);
r_1 = sqrt(a^2 + 4*b^2);
J = (M/3)*r_0^2;
fddot = 0;

x_24 = -m*l*r_1*sin(x(1) + theta_1 - x(3));

massMatrix = [1,                      0, 0 ,    0;... 
              0, (M*r_0^2 + m*r_1^2 +J), 0 , x_24;...
              0,                      0, 1 ,    0;...
              0,                   x_24, 0 , m*l^2 ]; 
          
odeConvert = [x(2);0;x(4);0];

forcing = [0; (M*r_0*sin(x(1) + theta_0) + m*r_1*sin(x(1) + theta_1)); 0 ; -m*l];
forcing = fddot.*forcing;

mystery = [0;-x(4)^2;0;x(2)^2];
mystery = m*l*r_1*cos(x(1) + theta_1 - x(3)).*mystery;

constant = [0; - M*g*r_0*cos(x(1) + theta_0) - m*g*r_1*cos(x(1) + theta_1);...
            0;-m*g*l*sin(x(3))];
        
dx = inv(massMatrix)*(odeConvert + forcing + mystery + constant);


end
