%% Finds a stable limit cycle:

clear all 
    
params = parameters(22);

ss = -params.P/params.A;

IC = [0.1*ss,0,0,0,0];
%IC = [0.0005    0.012    -0.0052    -0.0138  156.2942];
%IC = [0.5*ss,0,0,0,0];
map = [];

tSpan = 200*(2*pi/params.omega);

[tTotal,yTotal] = numericalSolution(IC,params,tSpan);

if any(any(isnan(yTotal)))
    fprintf('Error, NaN');
end

[~,locs] = findpeaks(cos(params.omega*tTotal));
map = [map, yTotal(locs(end),1:4)'];
IC = yTotal(locs(end),:);

figure
hold on
plot(tTotal,yTotal(:,1:4));
title('Dynamics');
ylabel('Angle/Angular velocity');
ylabel('Time');
legend('phi','dphi','psi','dphi');

[pks,locs] = findpeaks(cos(params.omega*tTotal));

figure
hold on
poincare = yTotal(locs,1:4);
scatter(1:1:length(locs),yTotal(locs,1))
scatter(1:1:length(locs),yTotal(locs,2))
scatter(1:1:length(locs),yTotal(locs,3))
scatter(1:1:length(locs),yTotal(locs,4))
title('Poincare map at max forcing');
xlabel('Map iterate');
ylabel('Angle/angular velocity');


figure
hold on
plot(yTotal(:,1),yTotal(:,2))
title('Phase Portrait');
xlabel('phi')
ylabel('dphi')


