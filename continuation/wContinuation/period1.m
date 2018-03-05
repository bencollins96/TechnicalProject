%%mContinuation
close all

% %Fundamental Constants:
% g = 9.81;           params.g = g;
% m = 0.25;            params.m = m;
% M = 1;            params.M = M;
% mu = m/M;           params.mu = mu;
% a = 0.25;           params.a =a;
% b = 1;              params.b = b;
% l = 0.75;           params.l = l;
% beeta = 1.84;     params.beeta = beeta;
% omega = 10;      params.omega = omega;
% r = 0.925;            params.r = r;
% numImpacts = 10;    params.numImpacts = numImpacts;
% alpha = a/b; params.alpha = alpha;

params = parameters;

tSpan = 200*(2*pi/params.omega);
[t,y] = numericalSolution([4*10^(-2),0,0,0,0],params,tSpan);

tStable = size(y,1)/2;
plot(t,y(:,1:2))
hold on
plot(t,0.1*cos(params.omega*t))
figure
plot(y(tStable:end,1),y(tStable:end,2))