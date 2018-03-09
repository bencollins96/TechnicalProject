%fourier
%First need to interpolate

params = parameters(1);
SS =  - params.P/params.A;
IC = [0.1*SS,0,0,0,0];
omega = 20;
params = parameters(20);

[t,y,poincare,impactInd] = numericalSolutionImp(IC,params,500);

tS = linspace(0,t(end),length(t)+1);

[tU,ia] = unique(t);
yU = y(ia,:);

[yS] = interp1(tU,yU,tS);

%Fourier transform of pendulum
Y = fft(yS(:,3));

Fs = length(t)/t(end);
L = length(t);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure('pos',[10 10 900 600]);
plot(f(1:5000),P1(1:5000),'LineWidth',2);
xlabel('Frequency, Hz');
ylabel('Amplitude');
savefig('frequency.fig');


figure('pos',[10 10 900 600]);
plot(y(260000:end,1),y(260000:end,2));
xlabel('Block Angle');
ylabel('Block Angular velocity');
savefig('r=1Orbit.fig');
close 

figure('pos',[10 10 900 600]);
plot(t(1:5000),y(1:5000,3),'LineWidth',2);
ylabel('Pendulum Angle');
xlabel('Time');
savefig('r=1OrbitPendulum.fig');



