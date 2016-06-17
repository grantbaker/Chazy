function [ result ] = ChazyEvalDirect(system, y0, y1)
%CHAZYEVALDIRECT Solves system in a line from y0 to y1 in a single step
%returns result at y1

step = y1(1)-y0(1);
k1 = system(y0);
k2 = system(y0 + (step/2)*k1);
k3 = system(y0 + (step/2)*k2);
k4 = system(y0 + step*k3);
sol = y0 + (step/6)*(k1 + 2*k2 + 2*k3 + k4);

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

