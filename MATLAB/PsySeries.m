function [ out ] = PsySeries(z)
%PSYSERIES outputs the result of the psy series to some degree l
%Double sum of logs and powers
%Assumes all coefficients are 1/((n+m)!) but this is not necessarily the case

z0=0;
beta = 2;
s=0;

for n = beta:100
    for m = 0:n
        s = s + (factorial(n+m))^-1*(z-z0)^n*(log(z-z0))^m;
    end
end

out = s;


end

