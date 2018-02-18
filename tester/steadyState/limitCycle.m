%% Finds a stable limit cycle:

clear all 
    
params = parameters(10);

IC = [-0.5*params.P/params.A,0,0,0,0];

map = [];


[tTotal,yTotal,te,ye,ie,se] = runfilippov(IC,params);

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
legend('phi','dphi','psi','dpsi');



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


