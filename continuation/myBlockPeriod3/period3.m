%%mContinuation
close all

params = parameters;

tSpan = 200*(2*pi/params.omega);
%[t,y] = numericalSolution([4*10^(-2),0,0,0,0],params,tSpan);

[t,y] = numericalSolution([0.004114939845612,0.058022614493736,0,0,1.256637061435906e+03],params,tSpan);

tStable = size(y,1)/2;
plot(t,y(:,1:4))
hold on
%plot(t,0.1*cos(params.omega*t))
figure
plot(y(tStable:end,1),y(tStable:end,2))