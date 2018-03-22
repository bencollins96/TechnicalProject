IC = [-0.0175746499136655,0.206010296683050,-0.0670264019030084,0.603312702379156,20696.8124018496];
%IC = [0.034515100012267  -0.394127102447722   0.098426894508158  -1.307789618478880 1.878672406846696e+03];
paramVec1 = linspace(6.54,3,40);
%paramVec1 = linspace(3,2.5,70);
paramVec = [paramVec1];
[totalPoincare] = wContinuation(IC, paramVec,300);

figure; hold on;
for i =1:length(totalPoincare)
    scatter(paramVec(i)*ones(12,1),totalPoincare{i}(:,1),'k','filled');
end
