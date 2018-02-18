%% For stable limit cycle, i think...
%TODO: find the values at the poincaré section.

clear all 


params = parameters(10);

IC = [-0.5*params.P/params.A,0,0,0,0];


map = [];
for i =1:20
    params = parameters(8+0.5*i);
    [tTotal,yTotal,te,ye,ie,se] = runfilippov(IC,params);
    if any(any(isnan(yTotal)))
        fprintf('Error, NaN');
        break
    end
    [~,locs] = findpeaks(cos(params.omega*tTotal));
    map = [map, yTotal(locs(end),1:4)'];
    IC = yTotal(locs(end),:);
    fprintf('Omega = %d\n',8+0.5*i);
end


figure
hold on
%plot(tTotal,yTotal(:,1:4));
plot(tTotal,10*params.beeta*cos(yTotal(:,5)));
plot(tTotal,10*params.beeta*cos(params.omega*tTotal));
b = zeros(10,1);
c = [1:1:10]*(2*pi/params.omega);

[pks,locs] = findpeaks(cos(params.omega*tTotal));

figure
hold on
length(locs)
poincare = yTotal(locs,1:4);
scatter(1:1:length(locs),yTotal(locs,1))
scatter(1:1:length(locs),yTotal(locs,2))
scatter(1:1:length(locs),yTotal(locs,3))
scatter(1:1:length(locs),yTotal(locs,4))

