% disable verbose diagnostics
opts = optimoptions('fsolve','Display','none');

% Find a starting point for p = 1 from starting guess of 1
p0 = 1;
x0 = fsolve(@(x)rhs(x, p0), 1, opts);

% Find a second starting point for p = 0.9 from starting guess of x0
p1 = 0.9;
x1 = fsolve(@(x)rhs(x, p1), x0, opts);

% Predict and correct, repeatedly
niter = 30;                               % Do 30 steps
xx = [x0, x1, zeros(length(x0), niter)];  % Store the results (state)
pp = [p0, p1, zeros(1, niter)];           % Store the results (parameter)
y0 = [x0; p0];
y1 = [x1; p1];
for i = 1:niter
    % Predict
    secant = y1 - y0;
    y2hat = y1 + secant;
    % Correct
    y2 = fsolve(@(y)augmented(y, y2hat, secant), y2hat, opts);
    % Store
    xx(:, i + 2) = y2(1:end-1);
    pp(i + 2) = y2(end);
    % Rotate the variables for the next iteration
    y0 = y1;
    y1 = y2;
end

% Plot
figure;
plot(pp, xx, '.-');

%%% These are the functions we need to use

% This will work for vector valued functions, it just assumes the vector is
% a column vector. (You'll also need to change the starting guess for the
% initial point.)

% Define the right hand-side of the first order equation
function y = rhs(x,p)
y = x^2 - p;
end

% Define the augmented system (with the pseudo-arclength condition)
%   y = [x, p];
%   yhat = predicted point
%   secant = secant of the last two points
function z = augmented(y, yhat, secant)
z = [ rhs(y(1:end-1), y(end)); ... % The original equation
      secant'*(y - yhat)];         % The pseudo-arclength condition
end
