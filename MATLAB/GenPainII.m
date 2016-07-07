function [ out ] = GenPainII( in )
%GENPAINII Generalised Painleve II
%This system allows for variants in the exponent of z in the second term in
%Painleve II

alpha = 0;
p=15;

out = [1,in(3),2*(in(2))^3 + ((in(1))^p)*in(2) + alpha];

end