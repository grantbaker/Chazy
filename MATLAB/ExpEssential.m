function [ out ] = ExpEssential( z )
%ESSENTIAL Explicit function to generate an essential singular point at z0

z0 = 0;

out = exp(1/(z-z0));ComplexPlot

end