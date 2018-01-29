%% Rocking Block Analytic Solution
% First, a lot of coefficients need to be defined. We have: a ,b, mu, g ,
% beta, omega, which themselves form numbers and those numbers form
% numbers...

%TODO: Why don't the initial conditions quite match up? 1/30, 1/60 out...
%TODO: Where are my oscillations?
%TODO: Make a rocking block simulator

parameters

A = params(1); B = params(2);
C = params(3); P = params(4);
D = params(5); E = params(6);
F = params(7); Q = params(8);
beta = params(9); omega = params(10);   

%Eigenvalues x4 2 complex, 2 real.


lambda_test = (1/sqrt(2))*sqrt((E + A) + sqrt((E+A)^2 - 4*(A*E - B*D)));
discrim = sqrt((E+A)^2 - 4*(A*E - B*D));

lambda_1 = (1/sqrt(2))*sqrt((E+A) + discrim);
lambda_2 = -lambda_1;
lambda_3 =(1/sqrt(2))*sqrt((E+A) - discrim);
lambda_4 = - lambda_3;

%Big A Matrix
LinearMatrix = [0, 1, 0, 0;...
                A, 0, B, 0;...
                0, 0, 0, 1;...
                D, 0, E, 0];

[evec, ~] = eig(LinearMatrix);

%Eigenvectors these are correct now! missing a minus sign.
v_1 = [-B/(A - lambda_1^2);1];%-B*lambda_1/(A - lambda_1^2); 1; lambda_1];
v_2 = [-B/(A - lambda_2^2);1];%-B*lambda_2/(A - lambda_2^2); 1; lambda_2];
v_3 = [-B/(A - lambda_3^2);1];%-B*lambda_3/(A - lambda_3^2); 1; lambda_3];
v_4 = [-B/(A - lambda_4^2);1];%-B*lambda_4/(A - lambda_4^2); 1; lambda_4];

%Initial Conditions.
phi_0  = P/A;
dphi_0 = 0;
psi_0  = 0;
dpsi_0 = 0;

%Initial forcing term:
eigPoly = B*D -(E - omega^2)*(A + omega^2);
R_phi = beta*omega^2*(F*B - C*(E - omega^2))/eigPoly;
R_psi = beta*omega^2*((F*B - C*(E - omega^2)*(A+omega^2))/(B*eigPoly))  - (C/B);

%Transformed Initial Conditions
phi_bar = phi_0 - P/A - R_phi;
psi_bar = psi_0 - R_psi;

%sine and cosine coefficients:
C_12 = (A -lambda_1^2)/(lambda_1^2 + imag(lambda_3)^2);
C_22 = (A + imag(lambda_3)^2)/(lambda_1^2 + imag(lambda_3)^2);

C1 = C_12*(-psi_bar + (phi_bar*(A + imag(lambda_3^2)))/B);
C2 = -(C_12/lambda_1)*(dpsi_0 - (dphi_0*(A + imag(lambda_3^2)))/B);

C3 = C_22*(psi_bar - (phi_bar*(A - lambda_1^2))/B);
C4 = (C_22/imag(lambda_3))*(dpsi_0 - (dphi_0*(A - lambda_1^2))/B);

%The whole equations

t = linspace(0,1,100);

y = v_1*C1*cosh(lambda_1*t) + v_2*C2*sinh(lambda_1*t) +  ...
    v_3*C3*cos(imag(lambda_3)*t) + v_4*C4*sin(imag(lambda_3)*t) ...
    + [R_phi; R_psi]*cos(omega*t) +[P/A;0];
    

plot(t,y)
xlabel('Time');
ylabel('Angle');
legend('\phi','\psi');  




