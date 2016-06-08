function [ result ] = ChazyEvalChained(system, y0, yx, h, tol)
%CHAZYEVALCHAINED links together ChazyEvalSimple

y = [];
y(1,:) = y0(:);
s = size(yx);
for n = 1:s(2)
   disp(n)
   disp(y)
   y(n+1,:) = ChazyEvalSimple(system, y(n,:), yx(n), h, tol);
end

result = y(n+1,:);

end

