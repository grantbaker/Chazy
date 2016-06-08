function [ out ] = ChazyEq( inVector )
%CHAZYEQ The Chazy Equation
    out = [1,inVector(3),inVector(4),2*inVector(2)*inVector(4)-3*(inVector(3))^2];
end

