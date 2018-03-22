params = parameters(2);
%Upper
%IC = [-0.0282180897960399,0.0337803135552537,-0.142203513538029,0.0887571255387587,3135.30946828261]
%paramVec = linspace(18.0310344827586,17.6,20);


IC = [0.0191516209255506,-0.211798119521287,0.0680459313271461,-0.815951448889072,6276.90212187241]
paramVec = linspace(18.2,20,40);
% [t,y,poincare] = numericalSolution(IC,params,500);
% figure; hold on;
% plot(y(200000:end,1),y(200000:end,2));
% [t,y,poincare] = numericalSolution(IC1,params,500);

% plot(y(200000:end,1),y(200000:end,2));
% 
% return


[totalPoincare] = wContinuation(IC,paramVec,500);

figure; hold on
for i =1:length(totalPoincare)
    scatter(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'k','filled');
end