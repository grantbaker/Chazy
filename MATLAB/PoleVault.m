function [ out ] = PoleVault(system, y0, ang, h, th, tol)
%POLEVAULT given an initial angle and initial condition, the function returns the set of points
%vaulting around a singularity of magnitude above 'tol'

y=[];
y(1,:) = y0;
lY = 1;
m = 0;
initAngle = 1i;
while (abs(m*th) < 2*pi)
    m = m+1;
    if (size(ChazyEvalDirect(system,y0,y0+h*exp(1i*(ang+th*m)),tol),1) ~= 0)
        initAngle = ang+th*m;
        break;
    end
    if (size(ChazyEvalDirect(system,y0,y0+h*exp(1i*(ang-th*m)),tol),1) ~= 0)
        initAngle = ang-th*m;
        break;
    end
end
if (initAngle == 1i)
    out = [];
    return;
end
disp(initAngle);
while (lY < 5 || abs(y(lY,1) - abs(y(lY,1)-y0)*exp(1i*ang) ) > 1/h)
    
end

end

