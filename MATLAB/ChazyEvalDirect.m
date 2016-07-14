function [ result ] = ChazyEvalDirect(system, y0, y1)
%CHAZYEVALDIRECT Solves system in a line from y0 to y1 in a single step
%returns result at y1

%%{
stepTol = 10^-2;
minStep = 10^-10;
minDelta = 10^-2;

step = y1(1)-y0(1);
%disp(abs(step));
if (abs(step) < minStep)
    error('CHAZY:ChazyEvalDirect:minStepSizeReached','Minimum step size reached.');
end
k1 = system(y0);
k2 = system(y0 + step*((1/4)*k1));
k3 = system(y0 + step*((3/32)*k1 + (9/32)*k2));
k4 = system(y0 + step*((1932/2197)*k1 + (-7200/2197)*k2 + (7296/2197)*k3));
k5 = system(y0 + step*((439/216)*k1 + (-8)*k2 + (3680/513)*k3 + (-845/4104)*k4));
k6 = system(y0 + step*((-8/27)*k1 + (2)*k2 + (-3544/2565)*k3 + (1859/4104)*k4 + (-11/40)*k5));

R = max(abs((1/360)*k1 + (-128/4275)*k3 + (-2197/75240)*k4 + (1/50)*k5 + (2/55)*k6));
if (R<stepTol)
    result = y0 + step*((25/216)*k1 + (1408/2565)*k3 + (2197/4104)*k4 + (-1/5)*k5);
    return;
else
    %{
    delta = 0.84*(stepTol/R)^(1/4);
    if (delta <= minDelta)
        delta = minDelta;
    end
    n = floor(delta^-1);
    w0 = y0;
    for i = 1:n
        w0 = ChazyEvalDirect(system,w0,(i/n)*(y1(1)-y0(1))+y0(1));
    end
    result = w0;
    %}
    
    %%{
    w0 = y0;
    for n = 1:10
        w0 = ChazyEvalDirect(system,w0,(n/10)*(y1(1)-y0(1))+y0(1));
    end
    result = w0;
    %}
    return;
end
%}

%{
step = y1(1)-y0(1);
k1 = system(y0);
k2 = system(y0 + (step/2)*k1);
k3 = system(y0 + (step/2)*k2);
k4 = system(y0 + step*k3);
sol = y0 + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
%}

%{
if (max(abs(sol)) > tol)
    %disp('over tol');
    %disp(sol);
    result = [];
    return;
else
    result = sol;
    return;
end;
%}

result = sol;

end

