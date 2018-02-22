%%mContinuation
close all
t = linspace(0,4,1000);

params = parameters;

ss = -params.P/params.A;

tSpan = 200*(2*pi/params.omega);
[t,y] = numericalSolution([4*10^(-2),0,0,0,0],params,tSpan);

tStable = size(y,1)/2;
plot(t,y(:,1:2))
hold on
plot(t,0.1*cos(params.omega*t))
figure
plot(y(tStable:end,1),y(tStable:end,2))