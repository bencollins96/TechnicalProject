%%Analytic_composite

%TODO: get resonance working. Could it be todo with the discontiunity in
%time? YES YES YES! That is one problem, but also more...
%TODO: Can break with r ~ 0.5 thanks to v. small steps, but i think thats
%okay.
%TODO: could the answer be the minus sign issues?

clear all 
parameters

%Angular Coefficient of Restitution
r =0.9;

tLim = 5;
ss = -params(4)/params(1);
IC = [ss-0.5*ss,0,0,0];
yTotal = [];
tTotal = [];
currentTime = 0;

for i = 1:1  
    
    %Find the crossing time, given "initial conditions"
    crossTime = getCrossTime(IC,tLim);
    
    %Fixes case where block does not overturn
    if (crossTime == -1) 
        tVec = linspace(0,tLim,200);
        y = analytic(IC,tVec);
        yTotal = [yTotal,y];
        tTotal = [tTotal,tVec + currentTime];
        break
    end
        
    
    %Solve the solution up to the crossing time.
    tVec = linspace(0,crossTime,200);
    y = analytic(IC,tVec);
    
    %Initial conditions for next impact motion are end of the previous
    IC = y(:,end)';
    IC(2) = r*IC(2);
    
    %either introduce eps as error or set equal to zero and pass rocking sign as extra
    %parameter.
    IC(1) = sign(IC(2))*eps;
    
    %Add solution to total solution.
    yTotal = [yTotal,y];
    tTotal = [tTotal,tVec + currentTime];
    
    %To match offest in times
    currentTime = currentTime + crossTime;
end

plot(tTotal,yTotal);
legend('phi','dphi','psi','dpsi');
title('Analytic Solution');
grid on
xlabel('Time, t');
ylabel('Angle/ Angular velocity');
    
    
function crossTime =  getCrossTime(IC,tLim)

  %Initial rocking sign
  initSign = sign(IC(1));
  tVec = linspace(0,tLim,1000);
  
  %Solution up to time limit
  y = analytic(IC,tVec);
  
  %Which side is the block on?
  signVec = sign(y(1,:));
  
  %Find rough time of impact, need the minus one? i think fzero searches
  %forwards.
  timeImpact = tVec(find(signVec == -initSign, 1 ));
  
  %If no impact, do special things
  if(isempty(timeImpact))
      fprintf('Block does not impact in %ds interval\n',tLim);
      crossTime = -1;
      return
  end
    
  %Gives error if escapes bounds. want to catch.
  options = optimset('Tolx',eps);
  crossTime = fzero(@(t)phiAngle(IC,t),timeImpact,options);
  

end

function phiAng = phiAngle(IC,t)
    y = analytic(IC,t);
    phiAng = y(1,:);
end

function y = analytic(IC,t)

parameters

A = params(1); B = params(2);
C = params(3); P = params(4);
D = params(5); E = params(6);
F = params(7); Q = params(8);
beeta = params(9); omega = params(10); 

%Steady State for rocking around left corner.
ss = -P/A;

%Initial Conditions.
phi_0  = IC(1);
dphi_0 = IC(2);
psi_0  = IC(3);
dpsi_0 = IC(4);

%Left rocking +  or right rocking?
rocking = sign(IC(1));
    
%Eigenvalues x4 2 complex, 2 real.
discrim = sqrt((E+A)^2 - 4*(A*E - B*D));

lambda_1 = (1/sqrt(2))*sqrt((E+A) + discrim);
lambda_2 = -lambda_1;
lambda_3 =(1/sqrt(2))*sqrt((E+A) - discrim);
lambda_4 = - lambda_3;

%Eigenvectors these are correct now! missing a minus sign.
v_1 = [-B/(A - lambda_1^2);-B*lambda_1/(A - lambda_1^2); 1; lambda_1];
v_2 = [-B/(A - lambda_2^2);-B*lambda_2/(A - lambda_2^2); 1; lambda_2];
v_3 = [-B/(A - lambda_3^2);-B*lambda_3/(A - lambda_3^2); 1; lambda_3];
v_4 = [-B/(A - lambda_4^2);-B*lambda_4/(A - lambda_4^2); 1; lambda_4];

%Initial forcing term:
A_omega = (A+omega^2);
E_omega = (E+omega^2);
eigPoly = B*D -E_omega*A_omega;

R_psi = (beeta*omega^2*(D*C - A_omega))/eigPoly;
R_phi = (C*beeta*omega^2 - B*R_psi)/A_omega;

%Transformed Initial Conditions
phi_bar = phi_0 - sign(rocking)*ss - R_phi;
psi_bar = psi_0 - R_psi;

%Integration pre-constants:
A_1 = v_1(1); A_2 = v_3(1);
A_3 = v_1(2); A_4 = v_3(2);
A_5 = v_1(4); A_6 = v_3(4);

A_12 = A_1/(A_1-A_2);
A_56 = (A_5*A_3)/(A_6*A_3 - A_5*A_4);

c_4 = (1/2)*( A_12*(psi_bar - phi_bar/A_1) - A_56*(dpsi_0/A_5 - dphi_0/A_3));

c_3 = (1/2)*( A_12*(psi_bar - phi_bar/A_1) + A_56*(dpsi_0/A_5 - dphi_0/A_3));

c_2 = (1/2)*((-dphi_0/A_3 + phi_bar/A_1) - (A_2/A_1)*A_12*(psi_bar - phi_bar/A_1)...
              + (A_4/A_3)*A_56*(dpsi_0/A_5 - dphi_0/A_3));
          
c_1 = (1/2)*((dphi_0/A_3 + phi_bar/A_1) - (A_2/A_1)*A_12*(psi_bar - phi_bar/A_1)...
              - (A_4/A_3)*A_56*(dpsi_0/A_5 - dphi_0/A_3));
 
forcingTerm = [R_phi*cos(omega*t);-R_phi*omega*sin(omega*t);...
               R_psi*cos(omega*t);-R_psi*omega*sin(omega*t)];

y = c_1*v_1*exp(lambda_1*t) + c_2*v_2*exp(lambda_2*t) + c_3*v_3*exp(lambda_3*t) ...
    + c_4*v_4*exp(lambda_4*t) + forcingTerm + sign(rocking)*[ss;0;0;0];



end





