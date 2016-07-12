function [ out ] = Ess( in )
alpha = 1;

out = [1,in(3),(-1/in(1)^2)*(exp(1/in(1)))];

end