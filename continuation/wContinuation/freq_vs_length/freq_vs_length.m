%Plot the resonant frequency as a function of l.


lVec = linspace(0.0001,1,1000);
res = [];
for i =1:length(lVec)
    params = Copy_of_parameters(lVec(i));
    res(i) = params.lambda_1;
end

plot(lVec,res);

ylabel('Resonant frequency');
xlabel('Pendulum Length');
