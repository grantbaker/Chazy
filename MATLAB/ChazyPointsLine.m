function [ out ] = ChazyPointsLine(system, y0, y1, h, th, tol )
%CHAZYPOINTSLINE Generates and returns a list of points on a line between
%y0 and y1. 
%Uses recursion to evaluate the rest of the line behind a singularity of
%magnitude greater than tol

y=[];
y(1,:)=y0(:);
step = h*exp(1i*angle(y1(1)-y0(1)));
for n = 1:abs(y1(1)-y0(1))/h
    k1 = system(y(n,:));
    k2 = system(y(n,:) + (step/2)*k1);
    k3 = system(y(n,:) + (step/2)*k2);
    k4 = system(y(n,:) + step*k3);
    sol = y(n,:) + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
    if (max(abs(sol)) > tol)
        pv = PoleVault(system,y(n,:),angle(y1(1)-y(n,1)),h,th,tol);
        if (abs(pv(size(pv,1),1)-y0(1)) > abs(y1(1)-y0(1)))
            %disp('terminating following pole vault');
            warning('CHAZY:ChazyPointsLine:poleVaultPastDestination','Pole vault result past destination.');
            out = [y;pv];
            return;
        elseif (size(pv,1)==1)
            warning('CHAZY:ChazyPointsLine:poleVaultIncomplete','Pole vault incomplete.');
            out = [y;pv];
            return;
        else
            out = [y;pv;ChazyPointsLine(system,pv(size(pv,1),:),y1,h,th,tol)];
            return;
        end
    else
        y(n+1,:) = sol;
    end
end

out = y;

end

