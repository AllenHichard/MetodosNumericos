fun = @(x)x * cos(x) + x * sin(x); % function
x0 = [2, 3]; % initial interval
options = optimset('Display','iter'); % show iterations
[x, fval, exitflag, output] = fzero(fun,x0,options)

