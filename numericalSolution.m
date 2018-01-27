%% Numerical Solution

%Fundamental Constants:
g = 9.81;
mu = 0.00001;
a =0.1;
b = 1;
l = 0.5;
beta = 0;
omega = 0;


%Equation Constants:
r0 = sqrt(a^2 + b^2);
r1 = sqrt(a^2 + 4*b^2);
I = g/(mu*a^2 + (4/3)*r0^2);

A = I*b*(1+2*mu);
B = -2*I*b*mu;
C = (I*b)/g;
P = I*(-a*(1+mu));

D = (I*2*b^2*(1+2*mu))/l;
E = -(I*(3*mu*r0^2 + 4*r0^2))/(3*l);
F = (I*(2*b^2 - a^2*(3*mu + 4)))/(3*g*l);
Q = (I*2*a*b*(1+mu))/l;


params = [A,B,C,P,D,E,F,Q,beta,omega];

IC = [0.1; 0.1; -0.1; 0];

t = linspace(0,1,200);

[t,y] = ode45(@(t,x)odeFun(t,x,params),t, IC);



plot(t,y(:,1),t,y(:,3));
legend('phi','psi')

function dx = odeFun(t,x,params)

A  = [0        , 1 , 0         , 0;...
      params(1), 0 , params(2) , 0;...
      0        , 0 , 0         , 1;...
      params(5), 0 , params(6) , 0];

B  = [0         , 0          ;...
      params(3) , -params(4) ;...
      0         , 0          ;...
      params(7) , -params(8) ;];
  
  
dx = A*x;%B*[params(9)*cos(params(10)*t);1];
  
end