function [ out ] = LogSystem( inVector )
%Logarithm
    out = [1,inVector(3),(-3+2*log(inVector(1)))/(inVector(1))^3];
end