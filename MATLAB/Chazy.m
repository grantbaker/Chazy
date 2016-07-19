function [ out ] = Chazy( inVector )
%CHAZYEQ The Chazy Equation
    out = [1,inVector(3),inVector(4),(2+1)*inVector(2)*inVector(4)-(3+1)*(inVector(3))^2];
end

