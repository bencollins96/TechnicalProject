%% Visualise the Rocking Block.

phi = y(1,:);
psi = y(3,:);

mov(size(phi,2)) = struct('cdata',[],'colormap',[]);
for i = 1:size(phi,2)
    plotter(psi(i),phi(i));
    mov(i) = getframe;
    i
end

function plotter(psi,phi)

parameters

%Upright Block
vertices = [[0;0],[0;1],[1;1],[1;0]];
vertices = [a,0;0,b]*vertices;

%Rocking Block:
%Right rocking to start - rotate about [1;,0];
shiftVertices = vertices - vertices(:,1);
rotateVertices = [cos(phi), - sin(phi); sin(phi), cos(phi)]*shiftVertices;
newVertices = rotateVertices + vertices(:,1);
vertices = newVertices;
%Pendulum
pendAttach = vertices(:,3)/2 + vertices(:,2)/2;
pendEnd = l*[sin(psi); - cos(psi)] + pendAttach;
pendVec = [pendAttach,pendEnd];

%Plotting
hold off
plot([-1,2],[0;0]);
hold on
fig = scatter(pendVec(1,2),pendVec(2,2),'filled');
patch(vertices(1,:),vertices(2,:),'green','FaceAlpha',0.5);
plot(pendVec(1,:),pendVec(2,:),'k');
axis([-1,2,-1,2])
axis equal
hold off
end