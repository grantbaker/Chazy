function PolePlot(c)
%POLEPLOT Plots a scatterplot of all the poles.
%Takes input c (second output of ChazyPointsPoleVault) which is an analysis
%of all the poles found by said function and visualizes them

figure
scatter(real(c(:,3)),imag(c(:,3)));

end

