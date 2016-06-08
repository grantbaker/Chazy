function [ out ] = RamanujanQ( in )
%RAMANUJANQ The Ramanujan system in q-space

out = [1, (1/(12*in(1)))*((in(2))^2-in(3)), (1/(3*in(1)))*(in(2)*in(3)-in(4)), (1/(2*in(1)))*(in(2)*in(4)-(in(3))^2)];

end

