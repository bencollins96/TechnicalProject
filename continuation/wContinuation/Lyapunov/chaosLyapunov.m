close all
params = parameters(1);
%period 3
% omega = 17.7703145141713741/params.p;
%period 1
omega = 7.7400/params.p;

params = parameters(omega);
paramVec = omega;

%Period 3 
%IC = [0.0944353208407954,0.414482899710621,0.324670138563527,2.21848223442027,140711.934954287];

%Period 1
IC =[0.128129682680944,0.0870245072077756,0.369285861209354,1.18324365662893,273054.667079410];

% %Step 2: Iterate until orbit is on the attractor.
[~,~,poincare] = numericalSolutionImp(IC,params,10000);
pause

%Poincare(end,:) will be on the attractor.
p = poincare(end,:);

%Step 3: select a nearby point, the perturbation

pert = 5e-8;
p = poincare(end,:);
pdp = p + [pert,pert,-pert,pert,0];
d0  = sqrt(4*pert^2);
lyapunov = zeros(10000,1);
ends = zeros(10000,5);
for i = 1:10000
 
    %Step4: 4 Advance both orbits one interation
    [t,y,poincare]    = numericalSolutionImp(p,params, 1.0001);
    [tp,yp,poincarep] = numericalSolutionImp(pdp,params,1.0001);
    
    enda = poincare(end,1:5);
    endb = poincarep(end,1:5);
    
    %Calculate new separation. Do I include the time in this? 1:5?
    d1 = pdist([enda;endb]);
    ends(i,:) = endb - enda;
   
    %Step 5: evaluate log|d1/d0| 
    lyapunov(i) = log(abs(d1/d0));
    %Step 6 Readjust perturbed orbit so its separation is d0 and is in the same direction
    %as d1
    pdp = enda  + (d0/d1)*(endb - enda);
    p   = enda;
    
    i
end

figure('pos',[10 10 900 600]);
M = movmean(lyapunov,200);
plot(200:1:10000-200,M(200:end-200),'LineWidth',1.5);
ylabel('Average Lyapunov Exponent','Interpreter','latex');
xlabel('Iteration','Interpreter','latex');
set(gca,'FontSize',16);
