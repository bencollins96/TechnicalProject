%Plot the resonant frequency as a function of l.


muVec = linspace(0.0001,1,1000);
res = [];
for i =1:length(muVec)
    params = Copy_of_parameters(muVec(i));
    params.mu
    res(i) = params.lambda_1;
end

plot(muVec,res);

ylabel('Resonant frequency');
xlabel('Pendulum Length');
