function [ out ] = rk4(system, y0, r, h, th, tol)
%CHAZYPOINTSSIMPLE Generate points in the complex plane of system
y=[];
poles=[0;0;0;0];
p=1;
y(1,:)=y0(:);  
for ang = 0:th:(2*pi)
   yint = [];
   yint(1,:) = y(1,:);
   step = h*exp(1i*ang);
   n=1;
   o=0;
   while abs(yint(n,1)-yint(1,1))<r
       if (max(abs(yint(n,:)))>tol)
          c=yint(n,1);
           n=n-1;
          d=yint(n,:);
          f=ang
          if o<50
              a=generalPole(system,yint(n,:),ang,tol,h,th,r-abs(yint(n,1)-y0(1)));
          else
              break
           end
          if (a==0)
              break
          else
              in=0;
              pe=poleEval(a);
              for v=1:length(poles(3,:))
                  if abs((pe(3)-poles(3,v)))<h*10
                      in=1;
                  end
              end
              if in==0
                  poles(:,p)=pe;
                  p=p+1;
              end
              o=o+1;
              while ang>=2*pi
                  ang=ang-2*pi;
              end
              while ang<0
                  ang=ang+2*pi;
              end
              y1=yint(n,:);
              bool=1;
              for m=2:length(a(:,1))
                  y2=(a(m,1)-y1);
                  y3=(a(m-1,1)-y1);
                  if and((angle(y2(1))-ang)*(angle(y3(1))-ang)<=0,bool==1)
                      c=a(m,1);
                      bool=0;
                  else
                      yint(n+1,:)=y2;
                      n=n+1;
                  end
              end
              yint(n+1,:)=c;
              n=n+1;
          end       
       end
       k1 = system(yint(n,:));
       k2 = system(yint(n,:) + (step/2)*k1);
       k3 = system(yint(n,:) + (step/2)*k2);
       k4 = system(yint(n,:) + step*k3);
       yint(n+1,:) = yint(n,:)+(step/6)*(k1 + 2*k2 + 2*k3 + k4);
       n=n+1;
   end
   y = [y;yint];
   
end
out = [y];

end