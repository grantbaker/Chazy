function [ result ] = ChazyEvalDirect(system, y0, y1)
%CHAZYEVALDIRECT Solves system in a line from y0 to y1 in a single step
%returns result at y1

%{
step = y1(1)-y0(1);
k1 = system(y0);
k2 = system(y0 + (step/8)*k1);
k3 = system(y0 + (step/8)*k2);
k4 = system(y0 + (step/4)*k3);
k5 = system(y0 + (step/4)*k4);
k6 = system(y0 + (step/2)*k5);
k7 = system(y0 + (step/2)*k6);
k8 = system(y0 + (3*step/4)*k7);
k9 = system(y0 + (3*step/4)*k8);
k10 = system(y0 + step*k9);
sol = y0 + (step/10)*(1*k1+1*k2+1*k3+1*k4+1*k5+1*k6+1*k7+1*k8+1*k9+1*k10);
%}


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

