%Plot the resonant frequency as a function of l.


lVec = linspace(0.0001,1,1000);
res = [];
for i =1:length(lVec)
    params = parameters(lVec(i));
    res(i) = params.lambda_1;
end

figure('pos',[10 10 900 600]);
plot(lVec,res);
ylabel('Resonant frequency, omega');
xlabel('Pendulum Length, l');
savefig('freq_vs_length.fig');
