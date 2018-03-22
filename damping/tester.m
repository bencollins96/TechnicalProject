params = parameters(20.31350431255660);
IC = [0.0225759188938384,-0.0281256111454901,0.0296870547086729,-0.0245492297104814,4919.73409552162];
ICd = [0.0231857869673377,-0.227666525100378,-0.00670390124889762,-0.0823252638048909,16304.8658721310];

IC = [1e-5,0,0,0,0];
ICd = IC;

IC = [0.0723460537861275,0.175125718091663,-0.0909998758435554,0.314047341915020,2029.46885421901];
ICd = [0.0231857874598594,-0.227666523639981,-0.00670390118354515,-0.0823252637077774,2029.46885421901];

IC = [0.0225759188938384,-0.0281256111454901,0.0296870547086729,-0.0245492297104814,4919.73409552162];
ICd = [0.0180897018950547,-0.0363244369401567,0.000371288000124201,-0.0851438814893081,8978.67180395963];
[td,yd,poincared] = numericalSolutionDamp(ICd,params,100);

[t,y,poincare]   = numericalSolutionImp(IC,params,100);


figure('pos',[10,10,900,600]); hold on
hUnDamp = plot(y(:,1),y(:,2),'b','LineWidth',2);
pUnDamp = plot(y(:,3),y(:,4),'Color',[0.6,0.6,1],'LineWidth',2);
hDamp = plot(yd(:,1),yd(:,2),'r','LineWidth',2);
pDamp = plot(yd(:,3),yd(:,4),'Color',[1,.6,.6],'LineWidth',2);

xlabel('Angle, $\phi$ and $\psi$','Interpreter','latex');
ylabel('Angular Velocity, $\dot{\phi}$ and $\dot{\psi}$','Interpreter','latex');
legend([hUnDamp;pUnDamp;hDamp;pDamp],{'Block undamped','Pendulum undamped', 'Block damped','Pendulum damped'}, 'Interpreter','latex');
set(gca,'FontSize',16);
