function [ out ] = RamanujanTau( in )
%RAMANUJANTAU The Ramanujan system in Tau space

out = [1, (1i/6)*((in(2))^2-in(3)), (2i/3)*(in(2)*in(3)-in(4)), 1i*(in(2)*in(4)-(in(3))^2)];
end

