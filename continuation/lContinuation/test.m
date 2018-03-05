%test


lVec = linspace(0.0000001,1,1000);
res = [];

for i = 1:1000
    params = parameters(lVec(i));
    res = [res, params.res];
end


plot(lVec,res);