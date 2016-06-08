function a =chazyGraph(h,th,tol,t0,y10,y20,y30,r,th0)
    figure
    z=rk4(h,th,tol,t0,y10,y20,y30,r,th0);
    scatter3(real(z(1,:)),imag(z(1,:)),real(z(2,:)))
    [xq,yq] = meshgrid(min(real(z(1,:))):.05:max(real(z(1,:))),min(imag(z(1,:))):.05:max(imag(z(1,:))));
    vq = griddata(real(z(1,:)),imag(z(1,:)),real(z(2,:)),xq,yq);
    figure
    mesh(xq,yq,vq)
    figure
    contour(xq,yq,vq)
   
end