

%l = 0.75
IC = [0.00499106031032161,-0.00822208631200709,0.00539983476811185,-0.00597897168950745,21790.0866452988]

params = parameters(1);


paramVec = linspace(1,0.05,100);
[mu_10,maxBlock] = continuation(IC,paramVec,500);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end

figure
plot(paramVec,maxBlock);

