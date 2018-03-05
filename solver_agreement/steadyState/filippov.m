function [tvect,yvect,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,params,y0,C,inopts)
% Version 2006-07-12

% [tvect,yvect,te,ye,ie,se] = filippov(vfields,jacobians,pfunction,solver,tspan,y0,params,C,inopts)

%TODO: somethine to do with impact.... I dont really understand the
%problem......

%ME! I added the coefficient of restitution.


t1 = tspan(end);
t0 = tspan(1);

[state,dir] = findstate(vfields,jacobians,t0,y0,params);
         
options = odeset(inopts,'Events',@fevents);

yvect = [];tvect = [];
te = []; ye = []; ie = []; se = [];
stopit = 0;
y = [];

while ~stopit
    %Solve the system up to t1
  

    [t,y,TE,YE,IE] = feval(solver,@filippovfunc,tspan,y0,options,vfields,jacobians,params,C,state,dir);
    startRocking = sign(y(1,1));
    endRocking = -startRocking;
    
    
    
%     if any(isnan(y(end,:)))
%         error('y is a full of NaNs');
%     end
    %get ready for new solution, end point = new start point. Here is where
    %I impose the impact rule.
    y0 = y(end,:);
    y0(2) = params.r*y0(2);
    
    
    %add y and t values to total, also add time of events..
    yvect = [yvect;y];
    tvect = [tvect;t];
    te = [te;TE];
    ye = [ye;YE];

    tspan =[t(end),t1];
    
    if ~isempty(IE) && (t(end)~=t1)
        for k = 1:length(IE)
            ie = [ie;IE(k)];
            if IE(k) == 4
                if ~isempty(pfunction)
                    y0 = feval(pfunction,t,y0,params);                
                end
            else
                switch 1
                    case state(3)
                        switch IE(k)
                            case {2,3}
                                state(IE(k)-1) = -state(IE(k)-1);
                                state(3) = -state(3);
                                state(4) = -state(4);
                                state(5) = -state(5);    
                                dir([1,IE(k)]) = -[1,dir(IE(k))];
                            case 5
                            
                            otherwise
                                disp('Error, there is something wrong with the event in filippov')
                        end
                    case state(4)
                        switch IE(k)
                            case 1
                               state(1)=-state(1);
                               state(2)=-state(2);                           
                               dir(IE(k)) = -dir(IE(k));
                            case {2,3}
                                state(4) = -state(4);
                                state(5) = -state(5);    
                                dir(IE(k)) = -dir(IE(k));
                            case 5
                            
                            otherwise
                                disp('Error, there is something wrong with the event in filippov')
                        end
                    case state(5)
                        switch IE(k)
                            case 1
                               state(1)=-1;
                               state(2)=-1;
                               state(3)=-state(3);
                               dir(IE(k)) = -dir(IE(k));
                            case {2,3}
                                state(4) = -state(4);
                                state(5) = -state(5);    
                                dir(IE(k)) = -dir(IE(k));
                            case 5
                                
                           otherwise
                                disp('Error, there is something wrong with the event in filippov')
                        end
                    otherwise
                        disp('Error, There is something wrong with the state vector in filippov')        
                end
            end
            se = [se;state];                
       end
   elseif ~isempty(IE)
       stopit =1;
       ie = [ie;IE];
       se = [se;state];
   else
       stopit =1;    
   end
end    

%-------------------- findstate ------------------------

function [state,dir] = findstate(vfields,jacobians,t0,y0,params);

state = -1*ones(1,5);

[F1,F2,H,dH,h1,hdir] = feval(vfields,t0,y0,params,'');

dHF1 = dH*F1;
dHF2 = dH*F2;

dir = [-sign(H),-sign(dHF1),-sign(dHF2)];

if H > 0    
    state(1) = -state(1);
elseif H < 0
    state(2) = -state(2);
elseif sign(dHF1)*sign(dHF2) < 0
    state(3) = -state(3);
else
    if sign(dHF1) > 0
        state(1) = -state(1);
    else
        state(2) = -state(2);
    end
end

if sign(dHF1)*sign(dHF2) > 0
    state(4) = -state(4);
elseif sign(dHF1)*sign(dHF2) < 0
    state(5) = -state(5);    
else
    if isempty(jacobians)
        state(4) = -state(4);
    else
        [J1,J2,d2H] = feval(jacobians,t0,y0,params,'');
        if dHF1 == 0
            HxF1x_F1Hxx = dH*J1 + F1'*d2H;
            sig = sign(HxF1x_F1Hxx*F1)*sign(dHF2);
            dir(2) = -sign(HxF1x_F1Hxx*F1);
        elseif dHF2 == 0
            HxF2x_F2Hxx = dH*J2 + F2'*d2H;
            sig = sign(HxF2x_F2Hxx*F2)*sign(dHF1);
            dir(3) = -sign(HxF2x_F2Hxx*F2);
        else
            disp('ERROR: Something is wrong in filippov:findstate')
            sig = 1;
        end
        
        if sig < 0
            state(5) = -state(5);
        else
            state(4) = -state(4);
        end
    end
end


%-------------------- filippovfunc ------------------------

function dy = filippovfunc(t,y,vfields,jacobians,params,C,state,dir)

% if any(isnan(y))
%     error('y has NaNs');
% end

dy=zeros(length(y),1);

[F1,F2,H,dH,h1,hdir] = feval(vfields,t,y,params,'');

%F1,F2 are all nans! except for last value.
% if any(isnan(F1))
%     error('F1 has NaNs');
%     return
% end


switch 1
    case state(1)
        % Vector field in region 1        
        F = F1;
    case state(2)
        % Vector field in region 2        
        F = F2;
    case state(3)
        % Vector field on sliding region
        
        Fa   = 0.5*F1;
        Fb   = 0.5*F2;
        dHF1 = dH*F1;
        dHF2 = dH*F2;
        Hu   = -((dHF1+dHF2)/(dHF2-dHF1));
        F    = (Fa + Fb) + Hu*(Fb - Fa)- C*H*dH';       
    otherwise
        disp('Error, there is something wrong with the state vector in filippov:filippovfunc')
end

dy = F;


%-------------------- filippovevents ------------------------

function [value,isterminal,direction] = fevents(t,y,vfields,jacobians,params,C,state,dir);
                                       
[F1,F2,H,dH,h,hdir] = feval(vfields,t,y,params,'');

dHF1 = dH*F1;
dHF2 = dH*F2;
value = [H,dHF1,dHF2,h];
direction = [dir,hdir];    

switch 1
    case {state(1),state(2)}
        direction(1) = -state(1);
    case state(3)
        value(1) = 1;
        
        if isempty(jacobians)
            value      = [value,1];
            direction = [direction,0];
        else
            [J1,J2,d2H] = feval(jacobians,t,y,params,'');
            
            dHF1_p_dHF2 = dHF1+dHF2;
            dHF2_dHF1   = dHF2-dHF1;

            Hu   = -((dHF1_p_dHF2)/(dHF2_dHF1));
            
            F2_F1 = F2-F1;
            F2_F1_2 = 0.5*F2_F1;
            F1_p_F2 = F1+F2;
            F1_p_F2_2 = 0.5*F1_p_F2;

            J2_J1 = J2-J1;
            J2_J1_2 = 0.5*J2_J1;
            J1_p_J2 = J1+J2;
            J1_p_J2_2 = 0.5*J1_p_J2;
        
            dHu  = -(((F1_p_F2')*d2H+dH*(J1_p_J2))*(dHF2_dHF1)-...
                     ((F2_F1')*d2H + dH*(J2_J1))*(dHF1_p_dHF2))/(dHF2_dHF1^2);
            F    = (F1_p_F2_2) + (F2_F1_2)*Hu - C*H*dH';

            dHuF = dHu*F;
            value = [value,dHuF];
            direction  = [direction,0];
            
        end
        
    otherwise
        disp('ERROR: Wrong event in filippov:fevents')
end

isterminal = [1,1,1,1,0];
