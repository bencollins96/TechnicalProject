omega = 10;
params = parameters(omega)

fileID = fopen('testBlock.ode','w');
fprintf(fileID, '#The Rocking Block Xppaut file.\n');
fprintf(fileID, 'dw/dt=x\n');
fprintf(fileID,'dx/dt=A*w+B*y+C*i(t)+h(w)*P\n');
fprintf(fileID,'dy/dt=z\n');
fprintf(fileID,'dz/dt=D*w+E*y+F*i(t)+h(w)*Q\n');
fprintf(fileID,'#Where\n');
fprintf(fileID,'i(t)=-beeta*omega*omega*cos(omega*t)\n');
fprintf(fileID,'h(w) = sign(w)\n');
fprintf(fileID,'#and\n');
fprintf(fileID,'param A=%d,B=%d,C=%d,P=%d\n',params.A,params.B,params.C,params.P);
fprintf(fileID,'param D=%d,E=%d,F=%d,Q=%d\n',params.D,params.E,params.F,params.Q);
fprintf(fileID,'param beeta=%d,omega=%d\n',params.beeta,omega);
fprintf(fileID,'\n');
fprintf(fileID,'w(0)=0.001\n');
fprintf(fileID,'x(0)=0\n');
fprintf(fileID,'y(0)=0\n');
fprintf(fileID,'z(0)=0\n');
fprintf(fileID,'done');

