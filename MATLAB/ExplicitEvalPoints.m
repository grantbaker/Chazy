function [ out ] = ExplicitEvalPoints(func, y0, r, h, th, tol)
%EXPLICITEVALPOINTS Evaluates the function func in a circle of radius r at
%points separated by distance h and angles of th
n = floor((2*pi/th)*(r/h))+1;
y=zeros(n,1);

lY = 0;

for angle = 0:th:2*pi
    for mag = 0:h:r
        disp(y0(1)+mag*exp(1i*angle));
        eval = func(y0(1)+mag*exp(1i*angle));
        if (abs(eval)<tol)
            lY = lY+1;
            y(lY,1) = y0(1)+mag*exp(1i*angle);
            y(lY,2) = func(y0(1)+mag*exp(1i*angle));
        end
    end
end

out = y(1:lY,:);

end

