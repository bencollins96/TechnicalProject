function eTotal = energy(t,y,params)

numEl = size(y,1);

eTotal = [];
for i =1:numEl
    eTotal = [eTotal,potKin(y(i,:),t(i),params)];
end

    function E = potKin(y,t,params)
        
        phi  = y(1);
        dphi = y(2);
        psi  = y(3);
        dpsi = y(4);
        
        rocking = sign(phi);
        xdot = -params.beeta*params.omega*sin(params.omega*t);
        
        %T_b = (M/2)*(xdot^2 -2*r_0*xdot*y(2)*sin(rocking*y(1) + theta_0) + (r_0^2*y(2)^2)) + (J/2)*y(2)^2;
        
        %T_p = (m/2)*(xdot^2 -2*r_1*xdot*y(2)*sin(rocking*y(1) + theta_1) + 2*l*xdot*y(4)*cos(y(3)) ...
        %      -2*r_1*l*y(4)*y(2)*sin(theta_1 + rocking*(y(1) - y(2))) + (l*y(4))^2 + (r_1*y(2))^2);
                 
        V_b = params.M*params.g*params.r_0*sin(rocking*phi + params.theta_0);
        
        V_m = params.m*params.g*(params.r_1*sin(params.theta_1 + rocking*phi) - params.l*cos(psi));
        
        %w/o forcing...
         T_b = (params.M/2)*((params.r_0^2*dphi^2)) + (params.J/2)*dphi^2;
         
         T_p = (params.m/2)*(-2*params.r_1*params.l*dpsi*dphi*sin(params.theta_1 + rocking*(phi - psi))...
                + (params.l*dpsi)^2 + (params.r_1*dphi)^2);
        
        E = T_b + T_p + V_b + V_m;
      
    end

end