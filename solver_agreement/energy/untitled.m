%% To visualise the energy of the system.

params = parameters;
IC = [-0,5*params.P/params.A,0,0,0,0];
tSpan = 10;
[tLinear,yLinear] = numericalSolution(IC,params,10);
[tNonlin,yNonlin] = nonlinearSolution(IC,params,10);


