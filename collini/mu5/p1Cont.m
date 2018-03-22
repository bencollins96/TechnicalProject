

%l = 0.75
IC = [0.00492235029015102,-0.00795740327583566,0.00525862848828308,-0.00561446607244814,16889.2021056987]


paramVec = linspace(1,0.05,100);
[totalPoincare,maxBlock] = continuation(IC,paramVec,500);

figure
hold on
for i =1:length(mu_5)
    scatter(mu_5{i}(:,6),mu_5{i}(:,1),'b','filled');
end
  
figure
plot(paramVec,maxBlock);

