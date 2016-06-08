function [ result ] = ChazyEvalSimple(system, y0, y1, h, tol)
%CHAZYEVALSIMPLE Solves system in a line from y0 to y1
%returns result at y1

y=[];
y(1,:)=y0(:);
step = h*exp(1i*angle(y1(1)-y0(1)));
for n = 1:abs(y1(1)-y0(1))/h
    if (max(abs(y(n,:) + step*system(y(n,:))))>tol)
        result = y(n,:);
        return;
    end
    k1 = system(y(n,:));
    k2 = system(y(n,:) + (step/2)*k1);
    k3 = system(y(n,:) + (step/2)*k2);
    k4 = system(y(n,:) + step*k3);
    y(n+1,:) = y(n,:) + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
end
result = y(n+1,:);
end

