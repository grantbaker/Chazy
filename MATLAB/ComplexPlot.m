function ComplexPlot(points, tol)
%ComplexPlot Plots a set of points in the complex plane

figure
scatter3(real(points(:,1)),imag(points(:,1)),real(points(:,2)))
figure
scatter(real(points(:,1)),imag(points(:,1)));
points = points(abs(points(:,2))<tol,:);
[xq,yq] = meshgrid(min(real(points(:,1))):.05:max(real(points(:,1))),min(imag(points(:,1))):.05:max(imag(points(:,1))));
vq = griddata(real(points(:,1)),imag(points(:,1)),real(points(:,2)),xq,yq);
figure
mesh(xq,yq,vq)
figure
contour(xq,yq,vq)

end

