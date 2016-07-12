function [ out ] = Elliptic( inVector )
%Elliptic Functon
    out = [1,inVector(3),inVector(2)^3+0*inVector(2)^2+0*inVector(2)];
end