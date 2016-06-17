function [ out ] = ChazyPointsSimple(system, y0, r, h, th, tol)
%CHAZYPOINTSSIMPLE Generate points in the complex plane of system
y=[];
y(1,:)=y0(:);

for ang = 0:th:(2*pi)
    yint = [];
    yint(1,:) = y(1,:);
    step = h*exp(1i*ang);
    disp(100*ang/(2*pi));
    for n = 1:r/h
       %{
        k1 = system(yint(n,:));
      	k2 = system(yint(n,:) + (step/2)*k1);
        k3 = system(yint(n,:) + (step/2)*k2);
        k4 = system(yint(n,:) + step*k3);
        sol = yint(n,:)+(step/6)*(k1 + 2*k2 + 2*k3 + k4);
        %}
        sol = ChazyEvalDirect(system,yint(n,:),yint(n,1)+step);
        if (max(abs(sol)) > tol)
            break;
        else
            yint(n+1,:) = sol;
        end
    end
    y = [y;yint];
   
end
out = y;

end

