function [ out ] = PainleveI( in )
%PAINLEVEI Function equivalent to the first Painleve equation
    out = [1,in(3),6*(in(2))^2 + in(1)];
end

