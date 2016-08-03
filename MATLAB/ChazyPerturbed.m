function [ out ] = ChazyPerturbed( inVector )
%CHAZYPERTURBED The Chazy Equation

delta = 0;
epsilon = 0.1;
    out = [1,inVector(3),inVector(4),(2+delta)*inVector(2)*inVector(4)-(3+epsilon)*(inVector(3))^2];
end

