function eTotal = energy(t,y,params)

numEl = size(y,1);

eTotal = [];
for i =1:numEl
    eTotal = [eTotal,potKin(y(i,:),t(i),params)];
end

    function E = potKin(y,t,params)
        beeta = params(1); omega = params(2);
        r_0 = params(3)  ; r_1 = params(4);
        theta_0 = params(5); theta_1 = params(6);
        M = params(7); m = params(8);
        J = params(9); l = params(10);
        
        g = 9.81;
        phi  = y(1);
        dphi = y(2);
        psi  = y(3);
        dpsi = y(4);
        
        rocking = sign(phi);
        xdot = -beeta*omega*sin(omega*t);
        
        %T_b = (M/2)*(xdot^2 -2*r_0*xdot*y(2)*sin(rocking*y(1) + theta_0) + (r_0^2*y(2)^2)) + (J/2)*y(2)^2;
        
        %T_p = (m/2)*(xdot^2 -2*r_1*xdot*y(2)*sin(rocking*y(1) + theta_1) + 2*l*xdot*y(4)*cos(y(3)) ...
        %      -2*r_1*l*y(4)*y(2)*sin(theta_1 + rocking*(y(1) - y(2))) + (l*y(4))^2 + (r_1*y(2))^2);
                 
        V_b = M*g*r_0*sin(rocking*phi + theta_0);
        
        V_m = m*g*(r_1*sin(theta_1 + rocking*phi) - l*cos(psi));
        
        %w/o forcing...
         T_b = (M/2)*((r_0^2*dphi^2)) + (J/2)*dphi^2;
         
         T_p = (m/2)*(-2*r_1*l*dpsi*dphi*sin(theta_1 + rocking*(phi - psi)) + (l*dpsi)^2 + (r_1*dphi)^2);
        
        E = T_b + T_p + V_b + V_m;
      
    end

end