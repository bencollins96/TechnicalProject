close all
params = parameters(1);
omega = 17.7703145141713741/params.p;
params = parameters(omega);
paramVec = omega;
IC = [0.0944353208407954,0.414482899710621,0.324670138563527,2.21848223442027,140711.934954287];
% 
% %Step 2: Iterate until orbit is on the attractor.
% [t,y,poincare] = numericalSolutionImp(IC,params,2000);

%Poincare(end,:) will be on the attractor.
p = poincare(end,:);

%Step 3: select a nearby point, the perturbation
d0 = 5e-10;
pdp = p + d0;


lyapunov = zeros(200,1);
for i = 1:200

    %Step4: 4 Advance both orbits one interation
    [t,y,poincare] = numericalSolutionImp(p,params,3.0001);
    [tp,yp,poincarep] = numericalSolutionImp(pdp,params,3.0001);
    
    enda = poincare(end,1:5);
    endb = poincarep(end,1:5);

    %Calculate new separation. Do I include the time in this? 1:5?
    d1 = pdist([enda;endb]);

    %Step 5: evaluate log|d1/d0| 
    lyapunov(i) = log(abs(d1/d0));

    %Step 6 Readjust perturbed orbit so its separation is d0 and is in the same direction
    %as d1
    pdp = enda  + (d0/d1)*(endb - enda);
    p   = enda;
    
    i
end

