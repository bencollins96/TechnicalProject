function eTotal = energy(t,y,params)
%Block Kinetic, Pendulum Kinetic, Block Potential, Pendulum Potential]
numEl = size(y,1);

eTotal = [];
for i =1:numEl
    eTotal = [eTotal,potKin(y(i,:),t(i),params)];
end

eTotal = eTotal';

%Normalise? remove potential energy of upright block.
eTotal(:,3) = eTotal(:,3) - params.M*params.g*params.b;
eTotal(:,4) = eTotal(:,4) - params.m*params.g*(2*params.b-params.l);

    function E = potKin(y,t,params)
        
        phi  = y(1);
        dphi = y(2);
        psi  = y(3);
        dpsi = y(4);
        
        M = params.M;
        r0 = params.r_0;
        J = params.J;
        m = params.m;
        r1 = params.r_1;
        theta_1 = params.theta_1;
        l = params.l;
        theta_0 = params.theta_0;
        g = params.g;
        
        rocking = sign(phi);
        
        
        
        
        xdot = -params.beeta*params.omega*sin(params.omega*t);
        
        if sign(rocking) == -1
            %Negative Rocking
            T_b = (M/2)*((-r0*y(2)*sin(theta_0 - y(1)) + xdot)^2 + (-r0*y(2)*cos(theta_0 - y(1)))^2) + (J*y(2)^2)/2;
            
            T_p = (m/2)*((-r1*y(2)*sin(theta_1 - y(1)) + xdot + l*y(4)*cos(y(3)))^2 ...
                   + (r1*y(2)*cos(theta_1 - y(1)) + l*y(4)*sin(y(3)))^2);
            
            V_b = M*g*r0*sin(theta_0 - y(1));
            
            V_p = m*g*(r1*sin(theta_1 - y(1)) - l*cos(y(3)));
        else 
            %Positive Rocking
            T_b = (M/2)*((-r0*y(2)*sin(y(1) + theta_0) + xdot)^2 + ( r0*y(2)*cos(y(1) + theta_0))^2) + (J*y(2)^2)/2;
            
            T_p = (m/2)*((-r1*y(2)*sin(y(1) + theta_1) + l*y(4)*cos(y(3)) + xdot)^2 ...
                   + (r1*y(2)*cos(y(1) + theta_1) + l*y(4)*sin(y(3)))^2);
            V_b = M*g*r0*sin(y(1) + theta_0);
            
            V_p = m*g*(r1*sin(y(1) + theta_1) - l*cos(y(3)));
        end
            
        
        E = [T_b; T_p; V_b; V_p];
      
    end

end