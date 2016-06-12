function [ out ] = Elliptic( inVector )
%Elliptic Functon
    out = [1,inVector(3),inVector(2)^3+2*inVector(2)^2+3*inVector(2)];
end