function [ result ] = ChazyEvalPoleVault(system, y0, y1, h, th, tol)
%CHAZYEVALPOLEVAULT Same as ChazyEvalSimple but vaults around poles
y=[];
y(1,:)=y0(:);
step = h*exp(1i*angle(y1(1)-y0(1)));
for n = 1:abs(y1(1)-y0(1))/h
    %{
    k1 = system(y(n,:));
    k2 = system(y(n,:) + (step/2)*k1);
    k3 = system(y(n,:) + (step/2)*k2);
    k4 = system(y(n,:) + step*k3);
    sol = y(n,:) + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
    %}
    sol = ChazyEvalDirect(system,y(n,:),y(n,1)+step);
    if (max(abs(sol)) > tol)
        vaulted = PoleVault(system, y(n,:), angle(y1(1)-y0(1)), h, th, tol);
        if (size(vaulted,1)==0)
            result = y(n,:);
            return;
        else
            result = ChazyEvalPoleVault(system, vaulted(size(vaulted,1),:), y1, h, th, tol);
            return;
        end
    else
        y(n+1,:) = sol;
    end
end
result = y(n+1,:);


end

