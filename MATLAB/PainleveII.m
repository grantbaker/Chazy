function [ out ] = PainleveII( in )
%PAINLEVEII System equivalent to the second Painleve equation
alpha = 0;

out = [1,in(3),2*(in(2))^3 + ((in(1)))*in(2)+alpha];

end