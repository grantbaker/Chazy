function [ out ] = ChazyPointsPoleVault(system, y0, r, h, th, tol)
%CHAZYPOINTSPOLEVAULT Implements pole-vaulting techniques to generate
%points in the complex plane of complex-valued differential equations
%Returns a matrix of points, can be plotted with ComplexPlot

y=[];
y(1,:)=y0(:);

for ang = 0:th:(2*pi)
    %disp('new angle:');
    %disp(ang);
    y = [y;ChazyPointsLine(system,y0,y0+r*exp(1i*ang),h,th,tol)];
end

out = y;

end

