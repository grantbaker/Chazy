function [ out ] = ChazyPoints(system, y0, r, h, th, tol)
%CHAZYPOINTS Generate points in the complex plane of system
y=[];
y(1,:)=y0(:);
for ang = 0:th:(2*pi)
   yint = [];
   yint(1,:) = y(1,:);
   for n = 1:r/h
       step = h*exp(1i*ang);
       if (max(abs(yint(n,:) + step*system(yint(n,:))))>tol)
          break; 
       end
       k1 = system(yint(n,:));
       k2 = system(yint(n,:) + (step/2)*k1);
       k3 = system(yint(n,:) + (step/2)*k2);
       k4 = system(yint(n,:) + step*k3);
       yint(n+1,:) = yint(n,:)+(step/6)*(k1 + 2*k2 + 2*k3 + k4);
   end
   y = [y;yint];
   
end
out = y;

end

