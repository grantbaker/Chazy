function [ out,poles ] = ChazyPointsPoleVault(system, y0, r, h, th, tol)
%CHAZYPOINTSPOLEVAULT Implements pole-vaulting techniques to generate
%points in the complex plane of complex-valued differential equations
%Returns a matrix of points, can be plotted with ComplexPlot

y=[];
c=[];
y(1,:)=y0(:);

for ang = 0:th:(2*pi)
    %disp('new angle:');
    %disp(ang);
    disp(100*ang/(2*pi));
    [yint,circ] = ChazyPointsLine(system,y0,y0+r*exp(1i*ang),h,th,tol);
    y = [y;yint];
    c = [c;circ];
end

c(ismember(c,[0,0,0,0,0,0],'rows'),:)=[];

%del = zeros(size(c,1));
radAdj=16;
for i = 1:size(c,1)
    j=i+1;
    while j <= size(c,1)
        if or(abs(c(i,3)-c(j,3))<radAdj*c(i,5),abs(c(i,3)-c(j,3))<radAdj*c(j,5))
            %del(j)=1;
            disp(c(j,:));
            c(j,:)=[];
        else
            j=j+1;
        end
    end
end
%c(del,:) = [];

out = y;
poles = c;
disp(100);

end

